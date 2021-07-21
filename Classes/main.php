<?php
require_once '../vendor/autoload.php';
include_once '../DB/info.php';
include_once '../DB/db.php';

use Ozdemir\Datatables\Datatables;
use Ozdemir\Datatables\DB\MySQL;


if(isset($_GET['ajax'])) {

    $sql = 'select id,name from `orders` where `id` like "%'.$_GET['q'].'%" or `name` like "%'.$_GET['q'].'%" LIMIT 10';
    $db = new Dcon();
    $result = $db->connect()->query($sql);
    $rows = $result->fetchAll(PDO::FETCH_ASSOC);
   echo json_encode($rows);
    exit;
}

$_dbconnection = new Dcon();


$config = [ 'host'     => $_dbconnection->host,
            'port'     => $_dbconnection->port,
            'username' => $_dbconnection->user,
            'password' => $_dbconnection->passwd,
            'database' => $_dbconnection->db_name ];

$dt = new Datatables( new MySQL($config) );

$list ='id,start_date,end_date,courier_name,status,file,orders_list_id,created_at,updated_at,deleted_at';

$sql= '';

if($_GET['mindate'] && !$_GET['maxdate'] )
{
    $sql = ' and (start_date >= "'.$_GET['mindate']." 00:00:00".'" )';
}

if($_GET['maxdate'] && !$_GET['mindate'] )
{
    $sql = ' and (end_date <= "'.$_GET['maxdate']." 23:59:59".'" )';
}

if($_GET['maxdate'] && $_GET['mindate'] )
{
    $sql = ' and (start_date >= "'.$_GET['mindate']." 00:00:00".'" AND end_date <= "'.$_GET['maxdate']." 23:59:59".'") ';
}

$dt->query('Select '.$list.' from consignmentsh where 1 and deleted_at IS NULL '.$sql);



$dt->edit('file',function ($file) use ($base_path){
    $file = (object)$file;
    $apple = new Info_class();
    return $file->file? '<a target="_blank" href="'.$base_path.$file->file.'" download>File</a>':'';
});
$dt->edit('start_date',function ($data){
    $data = (object)$data;

        if($data->start_date)
            return date("d-m-Y", strtotime($data->start_date));
        return "";
    });
$dt->edit('end_date',function ($data){
    $data = (object)$data;
        if($data->end_date)
            return date("d-m-Y", strtotime($data->end_date));
        return "";

    });
$dt->add('action', function ($list) {
    $list = (object)$list;
    $route = new Info_class();

    return '<div>
                            <a class="btn btn-info btn small" href="'.$route->route('view.php',$list->id).'">View</a>
                            <a class="btn btn-primary btn small" href="'.$route->route('edit.php',$list->id).'">Edit</a>
                            <a class="btn btn-danger btn small" href="'.$route->route('delete.php',$list->id).'">Delete</a>
                        </div>';
    });
echo $dt->generate()->toJson(); 