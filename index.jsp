<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String buyerName = request.getParameter("buyerName");
    String orderAmount = request.getParameter("orderAmount");
    boolean isPost = "POST".equalsIgnoreCase(request.getMethod());
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <title>Total Gaming</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body { background-color: #121212; color: #ffffff; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        .game-card { cursor: pointer; transition: 0.2s; background-color: #1e1e1e; border: 1px solid #333; height: 100%; display: flex; flex-direction: column; justify-content: space-between; overflow: hidden; }
        .game-card:hover { transform: translateY(-5px); border-color: #0d6efd; box-shadow: 0 5px 15px rgba(13, 110, 253, 0.3); }
        .visual-banner { height: 140px; display: flex; align-items: center; justify-content: center; font-size: 3.5rem; border-bottom: 1px solid #333; }
        .side-panel { background-color: #1e1e1e; padding: 20px; border-radius: 8px; border: 1px solid #333; position: sticky; top: 20px; }
        .category-title { border-bottom: 2px solid #0d6efd; padding-bottom: 10px; margin-bottom: 20px; margin-top: 40px; font-weight: bold; }
        .remove-btn { cursor: pointer; color: #dc3545; transition: 0.2s; }
        .remove-btn:hover { color: #ffc107; }
    </style>
</head>
<body>

    <nav class="navbar navbar-dark bg-dark mb-4 shadow">
        <div class="container">
            <a class="navbar-brand fs-3 fw-bold text-primary" href="#">🎮 Total Gaming</a>
            <a class="nav-link text-info fs-6 border border-info rounded px-2" href="https://store.steampowered.com" target="_blank" id="external-steam-link">Visit Steam 🌐</a>
            <a class="nav-link text-white fs-5" href="#cart-section" id="cart-link">🛒 Cart (<span id="cart-count">0</span>)</a>
        </div>
    </nav>

    <div class="container-fluid px-4">
        <div class="row">
            <div class="col-md-9">

                <h2 class="category-title text-primary">🌍 Open World</h2>
                <div class="row g-3">
                    <div class="col-md-3">
                        <div class="game-card rounded text-center" id="game-elden-ring" onclick="showGame('Elden Ring', 59.99)">
                            <div class="visual-banner bg-dark text-warning"><i class="bi bi-shield-shaded"></i></div>
                            <div class="p-3"><h5>Elden Ring</h5></div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="game-card rounded text-center" id="game-gta-v" onclick="showGame('GTA V', 29.99)">
                            <div class="visual-banner bg-dark text-success"><i class="bi bi-car-front-fill"></i></div>
                            <div class="p-3"><h5>GTA V</h5></div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="game-card rounded text-center" id="game-yakuza-0" onclick="showGame('Yakuza 0', 19.99)">
                            <div class="visual-banner bg-dark text-danger"><i class="bi bi-lightning-charge-fill"></i></div>
                            <div class="p-3"><h5>Yakuza 0</h5></div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="game-card rounded text-center" id="game-cyberpunk" onclick="showGame('Cyberpunk 2077', 49.99)">
                            <div class="visual-banner bg-dark text-info"><i class="bi bi-cpu-fill"></i></div>
                            <div class="p-3"><h5>Cyberpunk 2077</h5></div>
                        </div>
                    </div>
                </div>

                <h2 class="category-title text-success">🌱 Indie</h2>
                <div class="row g-3">
                    <div class="col-md-6">
                        <div class="game-card rounded text-center" id="game-hades" onclick="showGame('Hades', 24.99)">
                            <div class="visual-banner bg-dark text-warning"><i class="bi bi-fire"></i></div>
                            <div class="p-3"><h5>Hades</h5></div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="game-card rounded text-center" id="game-hollow-knight" onclick="showGame('Hollow Knight', 14.99)">
                            <div class="visual-banner bg-dark text-info"><i class="bi bi-bug-fill"></i></div>
                            <div class="p-3"><h5>Hollow Knight</h5></div>
                        </div>
                    </div>
                </div>

                <h2 class="category-title text-danger">👻 Horror</h2>
                <div class="row g-3">
                    <div class="col-md-6">
                        <div class="game-card rounded text-center" id="game-outlast" onclick="showGame('Outlast', 19.99)">
                            <div class="visual-banner bg-dark text-secondary"><i class="bi bi-eye-slash-fill"></i></div>
                            <div class="p-3"><h5>Outlast</h5></div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="game-card rounded text-center" id="game-re4" onclick="showGame('Resident Evil 4', 39.99)">
                            <div class="visual-banner bg-dark text-danger"><i class="bi bi-virus"></i></div>
                            <div class="p-3"><h5>Resident Evil 4</h5></div>
                        </div>
                    </div>
                </div>

                <h2 class="category-title text-warning">🎯 Shooters</h2>
                <div class="row g-3 mb-5">
                    <div class="col-md-4">
                        <div class="game-card rounded text-center" id="game-cs2" onclick="showGame('CS2', 0.00)">
                            <div class="visual-banner bg-dark text-warning"><i class="bi bi-trophy-fill"></i></div>
                            <div class="p-3"><h5>CS2</h5></div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="game-card rounded text-center" id="game-mw3" onclick="showGame('COD: MW3 (2011)', 19.99)">
                            <div class="visual-banner bg-dark text-success"><i class="bi bi-crosshair"></i></div>
                            <div class="p-3"><h5>COD: MW3 (2011)</h5></div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="game-card rounded text-center" id="game-doom" onclick="showGame('Doom Eternal', 29.99)">
                            <div class="visual-banner bg-dark text-danger"><i class="bi bi-incognito"></i></div>
                            <div class="p-3"><h5>Doom Eternal</h5></div>
                        </div>
                    </div>
                </div>

            </div>

            <div class="col-md-3">
                <div id="game-details" class="side-panel mb-4 d-none">
                    <h3 id="detail-name" class="text-primary mb-3">Game Name</h3>
                    <p class="fs-4">Price: $<span id="detail-price">0.00</span></p>
                    <button class="btn btn-primary btn-lg w-100" id="add-to-cart-btn" onclick="addToCart()">Add to Cart ➕</button>
                    <div id="cart-error" class="alert alert-danger mt-3 d-none text-center" role="alert">Game is already in the cart!</div>
                </div>

                <div id="cart-section" class="side-panel">
                    <h3 class="mb-4">Your Cart</h3>
                    <ul id="cart-items" class="list-unstyled mb-4">
                        <li class="text-muted" id="empty-cart-msg">Your cart is currently empty.</li>
                    </ul>
                    <h4 class="mb-3">Total: $<span id="cart-total">0.00</span></h4>
                    <hr class="border-secondary">

                    <form id="checkout-form" method="POST" action="" class="d-none">
                        <label for="buyer-name" class="form-label">Full Name:</label>
                        <input type="text" id="buyer-name" name="buyerName" class="form-control mb-2" placeholder="Enter full name..." required>
                        
                        <label for="buyer-phone" class="form-label">Phone Number:</label>
                        <input type="tel" id="buyer-phone" name="buyerPhone" class="form-control mb-2" placeholder="10 digits" pattern="[0-9]{10}" title="Must be exactly 10 digits" required>
                        
                        <label for="buyer-cc" class="form-label">Credit Card:</label>
                        <input type="text" id="buyer-cc" name="buyerCC" class="form-control mb-3" placeholder="16 digits" pattern="[0-9]{16}" title="Must be exactly 16 digits" required>
                        
                        <input type="hidden" id="order-amount-hidden" name="orderAmount" value="0.00">
                        <button type="submit" class="btn btn-success btn-lg w-100" id="checkout-btn">Checkout 💳</button>
                    </form>

                    <% if (isPost && buyerName != null && !buyerName.trim().isEmpty()) { %>
                        <div id="checkout-success" class="alert alert-success mt-3 text-center" role="alert">
                            Enjoy your games, <%= buyerName %>!<br>
                            Purchase of $<%= orderAmount %> was processed successfully.
                        </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        var currentItem = { name: '', price: 0 };
        var cartTotal = 0;
        var cartCount = 0;
        var installedGames = [];

        function showGame(name, price) {
            currentItem = { name: name, price: price };
            document.getElementById('detail-name').innerText = name;
            document.getElementById('detail-price').innerText = price.toFixed(2);
            document.getElementById('game-details').classList.remove('d-none');
            var successBanner = document.getElementById('checkout-success');
            if(successBanner) successBanner.classList.add('d-none');
            document.getElementById('cart-error').classList.add('d-none');
        }

        function addToCart() {
            if (installedGames.indexOf(currentItem.name) !== -1) {
                document.getElementById('cart-error').classList.remove('d-none');
                return;
            }
            document.getElementById('cart-error').classList.add('d-none');
            var emptyMsg = document.getElementById('empty-cart-msg');
            if(emptyMsg) emptyMsg.style.display = 'none';

            installedGames.push(currentItem.name);
            var cartItems = document.getElementById('cart-items');
            var li = document.createElement('li');
            li.id = 'cart-item-' + currentItem.name.replace(/[^a-zA-Z0-9]/g, '');
            li.className = 'd-flex justify-content-between align-items-center mb-2 fs-5 border-bottom border-secondary pb-1';
            li.innerHTML = '<span>' + currentItem.name + '</span>' +
                           '<div><span class="me-3">$' + currentItem.price.toFixed(2) + '</span>' +
                           '<i class="bi bi-trash3-fill remove-btn" onclick="removeFromCart(\'' + currentItem.name + '\', ' + currentItem.price + ')"></i></div>';
            cartItems.appendChild(li);
            cartTotal += currentItem.price;
            cartCount++;

            document.getElementById('cart-total').innerText = cartTotal.toFixed(2);
            document.getElementById('cart-count').innerText = cartCount;
            document.getElementById('order-amount-hidden').value = cartTotal.toFixed(2);
            document.getElementById('checkout-form').classList.remove('d-none');
        }

        function removeFromCart(name, price) {
            var index = installedGames.indexOf(name);
            if (index !== -1) installedGames.splice(index, 1);

            var elementId = 'cart-item-' + name.replace(/[^a-zA-Z0-9]/g, '');
            var itemToRemove = document.getElementById(elementId);
            if (itemToRemove) itemToRemove.remove();
            
            cartTotal -= price;
            cartCount--;
            if (cartTotal < 0) cartTotal = 0;

            document.getElementById('cart-total').innerText = cartTotal.toFixed(2);
            document.getElementById('cart-count').innerText = cartCount;
            document.getElementById('order-amount-hidden').value = cartTotal.toFixed(2);
            
            if (cartCount === 0) {
                var cartItems = document.getElementById('cart-items');
                cartItems.innerHTML = '<li class="text-muted" id="empty-cart-msg">Your cart is currently empty.</li>';
                document.getElementById('checkout-form').classList.add('d-none');
            }
        }
    </script>
</body>
</html>