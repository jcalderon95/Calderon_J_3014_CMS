<?php 
    require_once '../load.php';
    confirm_logged_in();

    $products_table = 'tbl_products';
    $products       =  getAll($products_table);

    
    if(!$products){
        $message = 'Failed to get product list';
    }

    if(isset($_GET['id'])){
        $product_id = $_GET['id'];
        $delete_result = deleteProduct($product_id);

        if(!$delete_result){
            $message = 'Failed to delete product';
        }
    }

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Product</title>
</head>
<body>
    <h2>Delete a product</h2>
    <?php echo !empty($message)?$message:'';?>
    <table>
        <thead>
            <tr>
                <th>Product ID</th>
                <th>Product Name</th>
                <th>Product Price</th>
                <th>Product Review</th>
                <th>Product Brand</th>
                <th>Product Image</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
        <?php while($product = $products->fetch(PDO::FETCH_ASSOC)):?>
            <tr>
                <td><?php echo $product['product_id'];?></td>
                <td><?php echo $product['product_name'];?></td>
                <td><?php echo $product['product_price'];?></td>
                <td><?php echo $product['product_review'];?></td>
                <td><?php echo $product['product_brand'];?></td>
                <td><img width="150px" src="../images/<?php echo $product['product_image'];?>" alt="<?php echo $product['product_name'];?> Image"></td>
                
                <td><a href="admin_deleteproduct.php?id=<?php echo $product['product_id'];?>">Delete</a></td>
            </tr>
        <?php endwhile;?>
        </tbody>
    </table>
    <br>
    <a href="index.php">Go Back...</a>
    
</body>
</html>