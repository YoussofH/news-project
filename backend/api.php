<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Credentials: true");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Allow-Headers: Content-Type");
header('Content-Type: application/json');

$mysqli = new mysqli('localhost', 'root', "", "newsdb");

if ($mysqli->connection_error) {
    die("Connection Error (" . $mysqli->connect_errno . ')' . $mysqli->connect_error);
}

$request_method = $_SERVER["REQUEST_METHOD"];
// GET
// POST

switch ($request_method) {
    case 'GET':
        $response = getAllNews();
        echo json_encode($response);
        break;
    case 'POST':
        if (isset($_POST["title"]) && isset($_POST["description"]) && isset($_POST["image_url"])) {
            $title = $_POST["title"];
            $description = $_POST["description"];
            $image_url = $_POST["image_url"];
            $date_added = date('Y-m-d H:i:s');
            $response = createNews($title, $description, $image_url, $date_added);
            echo json_encode($response);
        } else {
            echo json_encode([
                "status" => "Please provide all required fields: title, description, image_url",
            ]);
        }
        break;
    default:
        echo json_encode([
            "status" => "something went wrong",
        ]);
        break;
}

function getAllNews()
{
    global $mysqli;
    $query = $mysqli->prepare("SELECT * FROM news");
    $query->execute();
    $query->store_result();
    $num_rows = $query->num_rows();

    if ($num_rows == 0) {
        $response["status"] = "No news";
    } else {
        $news = [];
        $query->bind_result($id, $title, $description, $image_url, $date_added);
        while ($query->fetch()) {
            $news_item = [
                'id' => $id,
                'title' => $title,
                'description' => $description,
                'image_url' => $image_url,
                'date_added' => $date_added
            ];

            $news[] = $news_item;
        }

        $response["status"] = "Success";
        $response["new"] = $news;
    }

    return $response;
}

function createNews($title, $description, $image_url, $date_added){
    global $mysqli;
    $query = $mysqli->prepare("INSERT INTO news (title, description, image_url, date_added) VALUES (?,?,?,?)");
    $query->bind_param("ssss", $title, $description, $image_url, $date_added);
    if($query->execute()){
        $response["status"] = "Success";
    }else{
        $response["status"] = "Failed";
    }

    return $response;
}
