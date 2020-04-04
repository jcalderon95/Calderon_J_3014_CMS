<?php
require_once 'load.php';

    $products_table = 'tbl_products';
    $getProducts = getAll($products_table);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sportscheck CMS</title>
</head>
<body>
    <h1>Sportscheck CMS</h1>

    <?php include 'templates/header.php';?>
    <?php while ($row = $getProducts->fetch(PDO::FETCH_ASSOC)): ?>
        <div class="movie-item">
            <img src="images/<?php echo $row['product_image']; ?>" alt="<?php echo $row['product_name']; ?>" />
            <h2><?php echo $row['product_name']; ?></h2>
            <h4>Price: <?php echo $row['product_price']; ?></h4>
            <a href="details.php?id=<?php echo $row['product_id']; ?>">Read More...</a>
        </div>
    <?php endwhile;?>
    <?php include 'templates/footer.php';?>

</body>
</html>