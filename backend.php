<?php

header("Content-Type:application/json");

//LOGIN
if ((isset($_GET['func']) && $_GET['func'] == "loginer") && (isset($_GET['driver_email'])) && (isset($_GET['driver_pd']))) {
    include('config.php');
    $driver_email = $_GET['driver_email'];
    $driver_pd = $_GET['driver_pd'];

    $sql = "select email, password from drivers where email = {$driver_email}";
    $result = $conn->query($sql);
    if (mysqli_num_rows($result) == 0) {
        echo "Wrong Email";
    }
    else {
        $row = $result->fetch_assoc();
        if ($row[0] == $driver_email && $row[1] == $driver_pd) {
            echo "OK";
        }
        else if ($row[0] == $driver_email && $row[1] != $driver_pd) {
            echo "Wrong Password";
        }
    }

    $conn->close();
}


//DRIVER STATUS UPDATE
if ((isset($_GET['func']) && $_GET['func'] == "driver_status_update") && (isset($_GET['driver_id'])) && (isset($_GET['driver_status'])) && (isset($_GET['driver_lat'])) && (isset($_GET['driver_lon']))) {
    include('config.php');
    $driver_id = $_GET['driver_id'];
    $driver_status = $_GET['driver_status'];
    $driver_lat = $_GET['driver_lat'];
    $driver_lon = $_GET['driver_lon'];

    if ($driver_status == "active") {
        $sql = "select driver_stops from driver_status where driver_id = {$driver_id} order by driver_status_time desc limit 1";
        $result = $conn->query($sql);
        $row = $result->fetch_assoc();
        $stops = $row['driver_stops'];

        $sqlput = "insert into driver_status values ({$driver_id},'{$driver_status}',{$driver_lat},{$driver_lon},{$stops})";
        if ($conn->query($sql) === TRUE) {
            echo "Driver Status Updated";
        }
    }
    else {
        $sqlput = "insert into driver_status values ({$driver_id},'{$driver_status}',{$driver_lat},{$driver_lon},0)";
        if ($conn->query($sql) === TRUE) {
            echo "Driver Status Updated";
        }
    }

    $conn->close();
}

//DUSTBIN STATUS UPDATER
if ((isset($_GET['func']) && $_GET['func'] == "dbinsts") && (isset($_GET['dbin_id'])) && (isset($_GET['status']))) {
    include('config.php');
    $dbin_id = $_GET['dbin_id'];
    $status = $_GET['status'];
    $sqlinsert = "insert into dustbin_status values ({$dbin_id}, {$status})";
    $conn->query($sqlisnert);
    if ($status == 'full') {
        assigner($dbin_id, 1);
    }
    $conn->close();
;}

//REGISTER DRIVER
if ((isset($_GET['func']) && $_GET['func'] == "register") && (isset($_GET['name'])) && (isset($_GET['vehicle'])) && (isset($_GET['mobile'])) && (isset($_GET['email'])) && (isset($_GET['password']))) {
    include('config.php');
    $name = $_GET['name'];
    $vehicle = $_GET['vehicle'];
    $mobile = $_GET['mobile'];
    $email = $_GET['email'];
    $pwd = $_GET['password'];

    $sqlput = "insert into drivers values ('{$name}','{$vehicle}','{$mobile}','{$email}','{$pwd}',0)";
    if ($conn->query($sql) === TRUE) {
        echo "Successfully Registered";
    }
    $conn->close();
}

//GARBAGE TRUCK ASSIGNER
function assigner($dbin_id, $dist)
{
    include('config.php');
    $sql = "select bin_lat, bin_lon from dustbins where bin_id = {$dbin_id}";
    $result = $conn->query($sql);
    $row = $result->fetch_assoc();
    $lat = $row['bin_lat'];
    $lon = $row['bin_lon'];
    $distance = $dist; //your distance in KM
    $R = 6371; //constant earth radius. You can add precision here if you wish
    $maxLat = $lat + rad2deg($distance / $R);
    $minLat = $lat - rad2deg($distance / $R);
    $maxLon = $lon + rad2deg(asin($distance / $R) / cos(deg2rad($lat)));
    $minLon = $lon - rad2deg(asin($distance / $R) / cos(deg2rad($lat)));

    $driver_id = -1;

    $sql = "select driver_id, SQRT(POW(69.1 * (latitude - {$lat}), 2) + POW(69.1 * ({$lon} - longitude) * COS(latitude / 57.3), 2)) AS distance from driver_status where driver_lat >= {$minLat} AND driver_lon >= {$minLon} AND driver_lat <= {$maxLat} AND driver_lon <= {$maxLon} AND driver_status = 'active' AND driver_stops < 20 AND driver_status_time >= SUBTIME(current_timestamp,'0 0:0:5.000000') order by distance";
    $result = $conn->query($sql);
    if (mysqli_num_rows($result) == 0) {
        assigner($dbin_id, $dist + 1);
    } else {
        $row = $result->fetch_assoc();
        $driver_id = $row['driver_id'];
        $makeassgn = "insert into assignments values ({$dbin_id},{$driver_id},'enroute')";
        $result = $conn->query($makeassgn);
    }
}
