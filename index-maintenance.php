<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Maintenance Mode</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(135deg, #01462f, #0ce093);
      color: #fff;
      display: flex;
      align-items: center;
      justify-content: center;
      min-height: 100vh;
      text-align: center;
      padding: 20px;
    }

    .container {
      background: rgba(1, 70, 47, 0.85);
      padding: 50px 40px;
      border-radius: 20px;
      box-shadow: 0 12px 30px rgba(0, 0, 0, 0.4);
      max-width: 700px;
      width: 100%;
      backdrop-filter: blur(8px);
      position: relative;
    }

    .gear {
      width: 160px;
      height: 160px;
      margin-bottom: 30px;
      fill: #ffffff;
      animation: rotate 8s linear infinite;
    }

    @keyframes rotate {
      from { transform: rotate(0deg); }
      to { transform: rotate(360deg); }
    }

    h1 {
      font-size: 3rem;
      margin-bottom: 20px;
    }

    p {
      font-size: 1.3rem;
      margin-bottom: 30px;
      line-height: 1.6;
    }

    footer {
      font-size: 1.1rem;
      color: #e0ffe9;
      margin-top: 25px;
    }

    @media (max-width: 600px) {
      h1 { font-size: 2.2rem; }
      p { font-size: 1.1rem; }
      footer { font-size: 1rem; }
      .gear { width: 120px; height: 120px; }
    }
  </style>
</head>
<body>
  <div class="container">
<img src="imessage.png" alt="Quick and Efficient Support" style="width:100%;">
    <h1>We’ll be back soon!</h1>
    <p>
      Our website is currently undergoing scheduled maintenance.  
      Thank you for your patience — we’ll be back online shortly.
    </p>

    <footer>&copy; 2025 Securities and Exchange Commission. All rights reserved.</footer>
  </div>
</body>
</html>
