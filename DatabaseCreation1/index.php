<?php

// ===============================
// SERVER CONFIGURATION
// ===============================
// DB connection info
$host = 'localhost';
$database = 'Orders';
$user = 'root';
$pass = '';

// Create a connection to the DB
$pdo = new PDO("mysql:host=$host;dbname=$database", $user, $pass);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

// ===============================
// RETRIEVE ALL DATA BY INVOICE ID
// ===============================
// This doesn't work as expected because the tables have the same column names
$stmt = $pdo->prepare(
    "SELECT
        *
    FROM
        `Order`,
        `Customer`,
        `Company`
    WHERE
        `Order`.`Order No.` = :order_no
    AND `Order`.`Cust. No.` = `Customer`.`Cust. No.`
    AND `Order`.`Comp. No.` = `Company`.`Comp. No.`
");
$stmt->execute(array(
    'order_no' => 1,
));
$allData = $stmt->fetch(PDO::FETCH_ASSOC);

$stmt = $pdo->prepare(
    "SELECT
        *
    FROM
         `Items`
    WHERE
     `Items`.`Order No.` = :order_no
");
$stmt->execute(array(
    'order_no' => 1,
));
$items = $stmt->fetchAll(PDO::FETCH_ASSOC);

?>

<html>
    <head>
        <style>
            th, td {
                padding: 10px;
                text-align: center;
                border: 1px solid #ddd;
            }

            .invoice {
                float: right;
                margin-right: 5%;
            }

            .company {
                margin-top: -25px;
            }

            .customer {

            }

            table {
                margin: 50px auto;
                border-collapse: separate;
                width: 100%;
                border: 1px solid #ddd;
            }

            .payable {
                text-align: right;
                margin-right: 6%;
                margin-top: -25px;
            }

            .questions {
                text-align: center;
                margin-top: 50px;
            }

            tr:nth-child(even){background-color: #f2f2f2}

            th {
                background-color: #0066cc;
                color: white;
            }

        </style>
    </head>
<body>

<?php

echo '<div class = invoice>';
echo '<h1 style = color: "#0066cc";>Invoice</h1>';
echo '<p><b> Date: </b> ' . $allData["Order Date"] . '</p>';
echo '<p><b> Order #: </b> ' . $allData["Order No."] . '</p>';
echo '<p><b> Customer #: </b> ' . $allData["Cust. No."] . '</p>';
echo '</div>';

echo '<div>';
echo '<h1>' . $allData["Comp. Name"] . '</h1>';
echo '<h2 class = company>"' . $allData["Comp. Slogan"] . '"</h2>';
echo '<p>';
echo $allData["Comp. Address"] . '<br>';
echo $allData["Comp. City"] . ', ' . $allData["Comp. State"] . ', ' . $allData["Comp. Zip"] . '<br>';
echo 'Phone #: ' . $allData["Comp. Phone"] . '<br>';
echo 'Fax #: ' . $allData["Comp. Fax"];
echo '</p>';
echo '</div>';

echo '<div>';
echo '<p>';
echo '<b>Bill To: </b><br>';
echo $allData["Cust. Name"] . '<br>';
echo $allData["Cust. Address"] . '<br>';
echo $allData["Cust. City"] . ', ' . $allData["Cust. State"] . ', ' . $allData["Cust. Zip"] . '</br>';
echo $allData["Cust. Phone"];
echo '</p>';
echo '</div>';

echo '<table>';
echo '<tr>';
echo '<th>Item No.</th>';
echo '<th>Item Description</th>';
echo '<th>Qty.</th>';
echo '<th>Item Taxed</th>';
echo '<th>Item Cost</th>';
echo '<th>Total Items Cost (Qty. * Item Cost)</th>';
echo '</tr>';
$sum = 0;
$taxable = 0;
$taxDue = 0;
foreach($items as $item) {
    echo '<tr>';
    echo '<td>' . $item["Item No."] . '</td>';
    echo '<td>' . $item["Item Description"] . '</td>';
    echo '<td>' . $item["Qty."] . '</td>';
    if($item["Item Taxed"]) {
        echo '<td>X</td>';
        $taxable += $item["Item Cost"]*$item["Qty."];
        $taxDue += ($item["Item Cost"]*$item["Qty."])*(0.0625);
    } else {
         echo '<td></td>';
    }
    echo '<td>$' . $item["Item Cost"] . '</td>';
    echo '<td>$' . ($item["Item Cost"]*$item["Qty."]) . '</td>';
    $sum += $item["Item Cost"]*$item["Qty."];

    echo '</tr>';
}
echo '<tr><td></td><td></td><td></td><td></td><td><b> Subtotal: </b></td><td>$'.$sum.'</td></tr>';
echo '<tr><td></td><td></td><td></td><td></td><td><b> Taxable: </b></td><td>$' . $taxable . '</td>';
echo '<tr><td></td><td></td><td></td><td></td><td><b> Tax rate: </b></td><td>6.25%</td>';
echo '<tr><td></td><td></td><td></td><td></td><td><b> Tax due: </b></td><td>$' . round($taxDue, 2) . '</td>';
echo '<tr><td></td><td></td><td></td><td></td><td><b> Total due: </b></td><td>$'. ($sum + round($taxDue, 2)) . '</td></tr>';
echo '</table>';
echo '</div>';

echo '<div class = payable>';
echo '<p> Make all checks payable to <b>' . $allData["Comp. Name"] . '</b></p>';
echo '</div>';

echo '<div class = questions>';
echo '<p> If you have any questions about this invoice, please contact: </p>';
echo '<b><p>';
echo 'Marc Aberin <br>';
echo '(514)123-4567 <br>';
echo 'marcaberin@accounting.com';
echo '</b></p>';
echo '<b> Thank You For Your Business! </b>';
echo '</div>';

?>
 </body>
</html>