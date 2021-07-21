<?php


include_once 'DB/info.php';
include_once 'DB/db.php';
include_once 'Classes/files.php';



class Create extends Dcon  {
    use Fileupload;

    function GetData($table) {
        $query = "SELECT id FROM ".$table." ORDER by id desc limit 1";
        $stm = $this->connect()->query($query);
        $rows = $stm->fetch(PDO::FETCH_ASSOC);
        return $rows['id']??0;
    }

    function setconsignmentsh($data)
    {

        $sql = "INSERT INTO `consignmentsh` (`start_date`, `end_date`, `courier_name`, `status`, `file`,  `created_at`, `updated_at`) VALUES (?,?,?,?,?,?,?)";
        $is_true =  $this->connect()->prepare($sql)->execute($data);
       if($is_true)
       {
           $id = $this->GetData('consignmentsh');

           foreach ($_POST['order_id'] as $order_id)
           {
               $query = "INSERT INTO `consignment_details`(`order_id`, `consignment_id`, `created_at`, `updated_at`) VALUES (?,?,?,?)";
                $this->connect()->prepare($query)->execute([$order_id,$id, date("Y-m-d h:i:s"), date("Y-m-d h:i:s")]);
           }

       }

       return true;

    }
}





class DeleteClass extends Dcon  {
    function delete($id)
    {
        $count=$this->connect()->prepare("DELETE FROM consignment_details WHERE consignment_id=:id");
        $count->bindParam(":id",$id,PDO::PARAM_INT);
        $count->execute();

        $count=$this->connect()->prepare("DELETE FROM consignmentsh WHERE id=:id");
        $count->bindParam(":id",$id,PDO::PARAM_INT);
        $count->execute();

       return true;

    }
}











class Edit extends Dcon  {
    use Fileupload;

    function GetData($table) {
        $query = "SELECT id FROM ".$table." ORDER bY id desc limit 1";
        $stm = $this->connect()->query($query);
        $rows = $stm->fetch(PDO::FETCH_ASSOC);
        return $rows['id']??0;
    }

    function GetDetails($table,$id) {
        $query = "SELECT * FROM ".$table." where id = ".$id."  ORDER By id desc limit 1";
        $stm = $this->connect()->query($query);
        $rows = $stm->fetch(PDO::FETCH_ASSOC);
     return (object)$rows;
    }

    function ConsignmentDetails($id) {
        $query = "SELECT orders.id AS id,orders.name AS name FROM consignment_details JOIN orders ON orders.id = consignment_details.order_id WHERE consignment_id = ".$id." ORDER BY orders.id";
        $stm = $this->connect()->query($query);
        $rows = $stm->fetchAll(PDO::FETCH_ASSOC);
        $oldselect = '';

            foreach ($rows as $details)
            {
                $details = (object)$details;
                $oldselect.= '<option value="'.$details->id.'" selected>'.$details->name.'</option>';
            }
            return $oldselect;

    }

    function Updateconsignmentsh($data,$id)
    {
        $keys=  implode("=?,",array_keys($data)).'=?';
        $sql = "UPDATE consignmentsh SET ".$keys." WHERE id=".$id;
        $is_true =  $this->connect()->prepare($sql)->execute(array_values($data));
       if($is_true)
       {
           $count=$this->connect()->prepare("DELETE FROM consignment_details WHERE consignment_id=:id");
           $count->bindParam(":id",$id,PDO::PARAM_INT);
           $count->execute();

           foreach ($_POST['order_id'] as $order_id)
           {
               $query = "INSERT INTO `consignment_details`(`order_id`, `consignment_id`, `created_at`, `updated_at`) VALUES (?,?,?,?)";
                $this->connect()->prepare($query)->execute([$order_id,$id, date("Y-m-d h:i:s"), date("Y-m-d h:i:s")]);
           }
       }

       return true;

    }
}










class View extends Dcon {

    function GetData($id) {
       $query = "SELECT *,count FROM consignmentsh ,(SELECT count('id') as count FROM consignment_details where consignment_id = ".$id." ) as details    where id =".$id;
        $stm = $this->connect()->query($query);
        $rows = $stm->fetch(PDO::FETCH_ASSOC);
       return $rows;
    }


    function GetDetails($id) {
        $query = "SELECT o.NAME, 
                         o.delivery_date, 
                         o.id, 
                         o.name AS oname,
                         c.name,
                         c.address,
                         c.Postcode,
                         c.phone
                 FROM consignment_details 
                 JOIN orders AS o ON o.id = consignment_details.order_id 
                 LEFT JOIN customers AS c ON c.order_id = o.customer_id 
                  where consignment_id =".$id;
        $stm = $this->connect()->query($query);
        $rows = $stm->fetchAll(PDO::FETCH_ASSOC);
        return $rows;
    }


}