<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PrimeTable Reservations</title>
    <style>
        /* Color palette inspired by the image */
        :root {
            --primary: #1a2e35;      /* Dark teal */
            --secondary: #d97b29;    /* Orange-brown */
            --accent: #5c8a8a;       /* Muted teal */
            --light: #f5f5f5;        /* Light gray */
            --dark: #333;            /* Dark gray */
            --highlight: #f8d7a3;   /* Light beige */
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: var(--light);
            color: var(--dark);
            line-height: 1.6;
        }

        .main-header {
            background-color: var(--primary);
            padding: 1rem;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .nav-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 1.8rem;
            font-weight: bold;
            color: var(--highlight);
        }

        .logo span {
            color: var(--secondary);
        }

        .nav-links {
            display: flex;
            gap: 2rem;
        }

        .nav-links a {
            color: rgba(255,255,255,0.9);
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .nav-links a:hover {
            color: var(--secondary);
        }

        .auth-buttons {
            display: flex;
            gap: 1rem;
        }

        .btn {
            padding: 0.6rem 1.2rem;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-login {
            background-color: transparent;
            color: white;
            border: 2px solid var(--secondary);
        }

        .btn-login:hover {
            background-color: var(--secondary);
        }

        .btn-register {
            background-color: var(--secondary);
            color: white;
        }

        .btn-register:hover {
            background-color: #c56a20;
        }

        .hero {
            background: linear-gradient(rgba(26, 46, 53, 0.8), rgba(26, 46, 53, 0.8)),
            url('https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
            background-size: cover;
            background-position: center;
            height: 60vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            color: white;
            padding: 0 2rem;
        }

        .hero h1 {
            font-size: 3rem;
            margin-bottom: 1rem;
        }

        .hero p {
            font-size: 1.2rem;
            max-width: 700px;
            margin-bottom: 2rem;
        }

        .btn-hero {
            background-color: var(--secondary);
            color: white;
            padding: 0.8rem 1.8rem;
            font-size: 1.1rem;
        }

        .packages {
            padding: 4rem 2rem;
            text-align: center;
        }

        .packages h2 {
            font-size: 2.2rem;
            margin-bottom: 3rem;
            color: var(--primary);
        }

        .package-container {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 2rem;
            margin-top: 2rem;
        }

        .package {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            padding: 2rem;
            width: 300px;
            transition: transform 0.3s ease;
        }

        .package:hover {
            transform: translateY(-10px);
        }

        .package h3 {
            color: var(--primary);
            margin-bottom: 1rem;
            font-size: 1.5rem;
        }

        .package .price {
            font-size: 2rem;
            color: var(--secondary);
            margin: 1rem 0;
            font-weight: bold;
        }

        .package ul {
            list-style: none;
            text-align: left;
            margin: 1.5rem 0;
        }

        .package li {
            margin-bottom: 0.5rem;
            position: relative;
            padding-left: 1.5rem;
        }

        .package li:before {
            content: "✓";
            color: var(--accent);
            position: absolute;
            left: 0;
        }

        .feedback {
            background-color: var(--primary);
            color: white;
            padding: 4rem 2rem;
            text-align: center;
        }

        .feedback h2 {
            font-size: 2.2rem;
            margin-bottom: 2rem;
        }

        .feedback form {
            max-width: 600px;
            margin: 0 auto;
        }

        .form-group {
            margin-bottom: 1.5rem;
            text-align: left;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 600;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 0.8rem;
            border: none;
            border-radius: 4px;
            font-size: 1rem;
        }

        .form-group textarea {
            height: 150px;
            resize: vertical;
        }

        footer {
            background-color: var(--dark);
            color: white;
            text-align: center;
            padding: 2rem;
            margin-top: 2rem;
        }

        @media (max-width: 768px) {
            .hero h1 {
                font-size: 2.2rem;
            }

            .package-container {
                flex-direction: column;
                align-items: center;
            }
        }
    </style>
</head>
<body>
<header class="main-header">
    <nav class="nav-container">
        <div class="logo">Prime<span>Table</span></div>
        <div class="nav-links">
            <a href="index.jsp">Home</a>
            <a href="userInterfase.jsp">Tables</a>
            <a href="my_reservation_page.jsp">Reservations</a>
            <a href="inquiry.jsp" class="active">Inquiries</a>
            <a href="paymentForm.jsp">Payments</a>
            <a href="login.jsp">Login </a>
            <a href="admin_page.jsp">Admin Info</a>
        </div>
    </nav>
</header>

<section class="hero">
    <h1>Reserve Your Perfect Dining Experience</h1>
    <p>Book tables at the finest restaurants with just a few clicks. Enjoy exclusive packages and personalized service.</p>
    <button class="btn btn-register" onclick="window.location.href='table_page.jsp';">Book Now</button>
</section>

<section class="packages">
    <h2>Our Table Packages</h2>
    <div class="package-container">
        <div class="package">
            <h3>Standard</h3>
            <div class="price">$25</div>
            <ul>
                <li>Table for 2-4 people</li>
                <li>Basic table setup</li>
                <li>Standard service</li>
                <li>1-hour reservation window</li>
            </ul>
            <button class="btn btn-login" onclick="window.location.href='table_page.jsp';">Select</button>

        </div>
        <div class="package">
            <h3>Premium</h3>
            <div class="price">$50</div>
            <ul>
                <li>Table for 4-6 people</li>
                <li>Premium table setup</li>
                <li>Priority service</li>
                <li>2-hour reservation window</li>
                <li>Complimentary appetizer</li>
            </ul>
            <button class="btn btn-login" onclick="window.location.href='table_page.jsp';">Select</button>
        </div>
        <div class="package">
            <h3>VIP</h3>
            <div class="price">$100</div>
            <ul>
                <li>Table for 6-8 people</li>
                <li>VIP section access</li>
                <li>Dedicated server</li>
                <li>3-hour reservation window</li>
                <li>Complimentary bottle of wine</li>
                <li>Priority parking</li>
            </ul>
            <button class="btn btn-login" onclick="window.location.href='table_page.jsp';">Select</button>
        </div>
    </div>
</section>

<section class="feedback">
    <h2>We Value Your Feedback</h2>
    <form>
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" id="name" placeholder="Your name">
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" placeholder="Your email">
        </div>
        <div class="form-group">
            <label for="message">Message</label>
            <textarea id="message" placeholder="Your feedback or suggestions"></textarea>
        </div>
        <button type="submit" class="btn btn-register">Submit Feedback</button>
    </form>
</section>

<footer>
    <p>&copy; 2023 PrimeTable Reservations. All rights reserved.</p>
</footer>
</body>
</html>