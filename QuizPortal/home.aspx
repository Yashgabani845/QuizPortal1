<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="QuizPortal.home" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Home</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .card:hover {
            transform: scale(1.05);
            box-shadow: 0px 0px 15px rgba(0,0,0,0.3);
        }
        .expanded-card {
            position: fixed;
            top: 10%;
            left: 25%;
            width: 50%;
            z-index: 1050;
            background: white;
            padding: 20px;
            box-shadow: 0px 0px 15px rgba(0,0,0,0.3);
        }
        .close-btn {
            float: right;
            cursor: pointer;
        }
        .carousel-inner img {
            width: 85%;      /* Set the width to 85% of the screen */
            max-width: 85%;  /* Ensure the image does not exceed 85% */
            height: auto;    /* Maintain aspect ratio */
            margin: 0 auto;  /* Center the image horizontally */
        }

        .carousel-control-prev, .carousel-control-next {
            width: 5%; /* Adjust the control button width */
        }

        .carousel-control-prev-icon, .carousel-control-next-icon {
            background-color: rgba(0, 0, 0, 0.5);
            border-radius: 50%; 
            padding: 10px; 
        }

    </style>
</head>
<body>
    <form id="home_form" runat="server">
        <!-- Navigation Bar -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Logo</a>
            <div class="collapse navbar-collapse justify-content-center">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Scores</a>
                    </li>
                </ul>
            </div>
            <a class="nav-link" href="#">Profile</a>
        </nav>

        <div id="quizCarousel" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="feed.jpg" class="d-block mx-auto" alt="Quiz 1">
                </div>
                <div class="carousel-item">
                    <img src="feed.jpg" class="d-block mx-auto" alt="Quiz 2">
                </div>
                <div class="carousel-item">
                    <img src="feed.jpg" class="d-block mx-auto" alt="Quiz 3">
                </div>
            </div>
            <a class="carousel-control-prev" href="#quizCarousel" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#quizCarousel" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>


        <!-- Quiz Cards -->
        <div class="container mt-4">
            <div class="row">
                <asp:Repeater ID="QuizRepeater" runat="server">
                    <ItemTemplate>
                        <div class="col-md-4 mb-4">
                            <div class="card" onclick='<%# "expandCard(\"" + Eval("quizname") + "\", \"" + Eval("description") + "\")" %>'>
                                <img class="card-img-top" src="feed.jpg" alt="Quiz Image">
                                <div class="card-body">
                                    <h5 class="card-title"><%# Eval("quizname") %></h5>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>

        <!-- Expanded Card -->
        <div class="card" onclick='<%# "expandCard(\"" + Eval("quizname") + "\", \"" + Eval("description") + "\")" %>'>
            <img class="card-img-top" src="feed.jpg" alt="Quiz Image">
            <div class="card-body">
                <h5 class="card-title"><%# Eval("quizname") %></h5>
            </div>
        </div>
    </form>

    <script>
        function expandCard(title, description) {
            document.getElementById('expandedCard').classList.remove('d-none');
            document.getElementById('expandedTitle').innerText = title;
            document.getElementById('expandedDescription').innerText = description;
        }

        function closeCard() {
            document.getElementById('expandedCard').classList.add('d-none');
        }
    </script>
</body>
</html>
