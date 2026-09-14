<?php
session_start();

if(!isset($_SESSION['authenticated']) || $_SESSION['authenticated'] !== true){
    header('Location: index.php');
    exit;
}

// Create
if(!isset($_SESSION['tasks'])){
    $_SESSION['tasks'] = [
        ['text' => 'Task 1', 'done' => true],
        ['text' => 'Task 2', 'done' => false],
        ['text' => 'Task 3', 'done' => false]
    ];
}

// Add
if(isset($_POST['add'])){
    $task = trim($_POST['task']);

    if($task != ''){
        $_SESSION['tasks'][] = [
            'text' => $task,
            'done' => false
        ];
    }

    header("Location: todolist.php");
    exit;
}

// Delete
if(isset($_GET['delete'])){
    $id = $_GET['id'];

    unset($_SESSION['tasks'][$id]);

    $_SESSION['tasks'] = array_values($_SESSION['tasks']);

    header("Location: todolist.php");
    exit;
}

// Toggle
if(isset($_GET['toggle'])){
    $id = $_GET['id'];

    $_SESSION['tasks'][$id]['done'] =
        !$_SESSION['tasks'][$id]['done'];

    header("Location: todolist.php");
    exit;
}
?>

<!DOCTYPE html>
<html>
  <head>
    <title>TODO App</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css"
    />
    <style type="text/css">
      body {
        background: #f1f1f1;
      }
    </style>
  </head>

  <body>

    <div
      class="card rounded shadow-sm"
      style="max-width: 500px; margin: 60px auto;"
    >

      <div class="card-body">

        <h3 class="card-title mb-3">My Todo List</h3>

        <ul class="list-group">

          <?php foreach($_SESSION['tasks'] as $id => $task): ?>

          <li
            class="list-group-item d-flex justify-content-between align-items-center">

            <div>

              <?php if($task['done']): ?>

              <a href="?toggle=1&id=<?php echo $id; ?>"
                 class="btn btn-sm btn-success">
                <i class="bi bi-check-square"></i>
              </a>

              <span class="ms-2 text-decoration-line-through">
                <?php echo $task['text']; ?>
              </span>

              <?php else: ?>

              <a href="?toggle=1&id=<?php echo $id; ?>"
                 class="btn btn-sm btn-light">
                <i class="bi bi-square"></i>
              </a>

              <span class="ms-2">
                <?php echo $task['text']; ?>
              </span>

              <?php endif; ?>

            </div>

            <div>

              <a href="?delete=1&id=<?php echo $id; ?>"
                 class="btn btn-sm btn-danger">
                <i class="bi bi-trash"></i>
              </a>

            </div>

          </li>

          <?php endforeach; ?>

        </ul>

        <div class="mt-4">

          <form
            class="d-flex justify-content-between align-items-center"
            method="POST"
          >

            <input
              type="text"
              name="task"
              class="form-control"
              placeholder="Add new item..."
              required
            />

            <button
              type="submit"
              name="add"
              class="btn btn-primary btn-sm rounded ms-2"
            >
              Add
            </button>

          </form>

        </div>

      </div>
    </div>

    <div class="text-center">
        <a href="05_logout_exercise.php" class="btn btn-primary">
          Logout
        </a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

  </body>
</html>