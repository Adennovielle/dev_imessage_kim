<?php
// ===============================
// FAKE DATA ONLY
// ===============================
$tickets = [
    [
        'ticket_id' => 1,
        'number' => 'TKT-1001',
        'created' => '10/29/25',
        'status' => 'Open',
        'subject' => 'Login issue on system',
        'department' => 'IT Support'
    ],
    [
        'ticket_id' => 2,
        'number' => 'TKT-1002',
        'created' => '10/29/25',
        'status' => 'Pending',
        'subject' => 'Cannot access dashboard',
        'department' => 'Support'
    ],
    [
        'ticket_id' => 3,
        'number' => 'TKT-1003',
        'created' => '10/29/25',
        'status' => 'Closed',
        'subject' => 'Payment not reflecting',
        'department' => 'Finance'
    ],
    [
        'ticket_id' => 4,
        'number' => 'TKT-1004',
        'created' => '10/29/25',
        'status' => 'Open',
        'subject' => 'Email not sending',
        'department' => 'IT Support'
    ],
    [
        'ticket_id' => 5,
        'number' => 'TKT-1005',
        'created' => '10/29/25',
        'status' => 'Pending',
        'subject' => 'System slow performance',
        'department' => 'Technical'
    ],
];
?>

<!DOCTYPE html>
<html>
<head>
    <title>Tickets UI Preview</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <style>
  
        .ticket-container {
            margin-top: 40px;
            min-height: 50vh;
        }

        table {
            background: #fff;
        }

        thead {
            background: #343a40;
            color: white;
        }

        .status-open {
            color: green;
            font-weight: bold;
        }

        .status-pending {
            color: orange;
            font-weight: bold;
        }

        .status-closed {
            color: red;
            font-weight: bold;
        }
    </style>
</head>

<body>

<div class="ticket-container container">

    <h3 class="mb-3">Tickets (UI Only Preview)</h3>

    <table class="table table-bordered table-hover">

        <thead >
            <tr class="bg-white">
                <th class="text-success">Ticket #</th>
                <th class="text-success">Create Date</th>
                <th class="text-success">Status</th>
                <th class="text-success">Subject</th>
                <th class="text-success">Department</th>
            </tr>
        </thead>

        <tbody class="border border-bottom-0">
            <?php foreach ($tickets as $t): ?>

                <tr  class="border border-bottom-0 bg-light">
                    <td><?= $t['number']; ?></td>

                    <td>
                        <?= date('m/d/y', strtotime($t['created'])); ?>

                    </td>

                    <td>
                        <?php
                            $statusClass = strtolower($t['status']);
                        ?>
                        <span class="status-<?= $statusClass; ?>">
                            <?= $t['status']; ?>
                        </span>
                    </td>

                    <td>
                        <a href="#" class="text-black fw-bolder">
                            <?= $t['subject']; ?>
                        </a>
                    </td>

                    <td>
                        <?= $t['department']; ?>
                    </td>
                </tr>

            <?php endforeach; ?>
        </tbody>

    </table>

</div>

</body>
</html>