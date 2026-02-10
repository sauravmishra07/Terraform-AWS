// Product Data
const products = [
    {
        id: 1,
        name: "Wireless Headphones",
        description: "Premium noise-canceling headphones with 30-hour battery life",
        price: 299.99,
        image: "🎧"
    },
    {
        id: 2,
        name: "Smart Watch",
        description: "Fitness tracker with heart rate monitor and GPS",
        price: 399.99,
        image: "⌚"
    },
    {
        id: 3,
        name: "Laptop Pro",
        description: "High-performance laptop with 16GB RAM and 512GB SSD",
        price: 1299.99,
        image: "💻"
    },
    {
        id: 4,
        name: "Wireless Mouse",
        description: "Ergonomic design with precision tracking",
        price: 49.99,
        image: "🖱️"
    },
    {
        id: 5,
        name: "Mechanical Keyboard",
        description: "RGB backlit mechanical keyboard with blue switches",
        price: 149.99,
        image: "⌨️"
    },
    {
        id: 6,
        name: "4K Webcam",
        description: "Ultra HD webcam with autofocus and noise reduction",
        price: 199.99,
        image: "📷"
    },
    {
        id: 7,
        name: "Smartphone Pro",
        description: "Latest flagship phone with advanced camera system",
        price: 999.99,
        image: "📱"
    },
    {
        id: 8,
        name: "Tablet Ultra",
        description: "12.9-inch display tablet with stylus support",
        price: 799.99,
        image: "📲"
    }
];

// Cart State
let cart = [];

// Initialize the application
document.addEventListener('DOMContentLoaded', () => {
    loadProducts();
    setupEventListeners();
    loadCartFromStorage();
});

// Load products into the grid
function loadProducts() {
    const productsGrid = document.getElementById('productsGrid');
    
    products.forEach(product => {
        const productCard = createProductCard(product);
        productsGrid.appendChild(productCard);
    });
}

// Create a product card element
function createProductCard(product) {
    const card = document.createElement('div');
    card.className = 'product-card';
    
    card.innerHTML = `
        <div class="product-image">${product.image}</div>
        <div class="product-info">
            <h3 class="product-name">${product.name}</h3>
            <p class="product-description">${product.description}</p>
            <div class="product-footer">
                <span class="product-price">$${product.price.toFixed(2)}</span>
                <button class="add-to-cart" data-id="${product.id}">Add to Cart</button>
            </div>
        </div>
    `;
    
    return card;
}

// Setup event listeners
function setupEventListeners() {
    // Add to cart buttons
    document.addEventListener('click', (e) => {
        if (e.target.classList.contains('add-to-cart')) {
            const productId = parseInt(e.target.dataset.id);
            addToCart(productId);
        }
    });
    
    // Cart icon
    document.getElementById('cartIcon').addEventListener('click', () => {
        openCartModal();
    });
    
    // Close cart modal
    document.getElementById('closeCart').addEventListener('click', () => {
        closeCartModal();
    });
    
    // Close modal on outside click
    document.getElementById('cartModal').addEventListener('click', (e) => {
        if (e.target.id === 'cartModal') {
            closeCartModal();
        }
    });
    
    // Checkout button
    document.getElementById('checkoutBtn').addEventListener('click', () => {
        checkout();
    });
    
    // Contact form
    document.getElementById('contactForm').addEventListener('submit', (e) => {
        e.preventDefault();
        handleContactForm();
    });
    
    // Smooth scroll for navigation
    document.querySelectorAll('.nav-link').forEach(link => {
        link.addEventListener('click', (e) => {
            e.preventDefault();
            const targetId = link.getAttribute('href');
            const targetSection = document.querySelector(targetId);
            targetSection.scrollIntoView({ behavior: 'smooth' });
        });
    });
}

// Add product to cart
function addToCart(productId) {
    const product = products.find(p => p.id === productId);
    
    if (!product) return;
    
    const existingItem = cart.find(item => item.id === productId);
    
    if (existingItem) {
        existingItem.quantity += 1;
    } else {
        cart.push({
            ...product,
            quantity: 1
        });
    }
    
    updateCartUI();
    saveCartToStorage();
    showNotification('Product added to cart!');
}

// Remove product from cart
function removeFromCart(productId) {
    cart = cart.filter(item => item.id !== productId);
    updateCartUI();
    saveCartToStorage();
    renderCartItems();
}

// Update product quantity
function updateQuantity(productId, change) {
    const item = cart.find(item => item.id === productId);
    
    if (item) {
        item.quantity += change;
        
        if (item.quantity <= 0) {
            removeFromCart(productId);
        } else {
            updateCartUI();
            saveCartToStorage();
            renderCartItems();
        }
    }
}

// Update cart UI
function updateCartUI() {
    const cartCount = cart.reduce((total, item) => total + item.quantity, 0);
    document.getElementById('cartCount').textContent = cartCount;
}

// Open cart modal
function openCartModal() {
    const modal = document.getElementById('cartModal');
    modal.classList.add('show');
    renderCartItems();
}

// Close cart modal
function closeCartModal() {
    const modal = document.getElementById('cartModal');
    modal.classList.remove('show');
}

// Render cart items
function renderCartItems() {
    const cartItemsContainer = document.getElementById('cartItems');
    const cartTotal = document.getElementById('cartTotal');
    
    if (cart.length === 0) {
        cartItemsContainer.innerHTML = '<div class="empty-cart">Your cart is empty</div>';
        cartTotal.textContent = '$0.00';
        return;
    }
    
    cartItemsContainer.innerHTML = '';
    
    cart.forEach(item => {
        const cartItem = document.createElement('div');
        cartItem.className = 'cart-item';
        
        cartItem.innerHTML = `
            <div class="cart-item-info">
                <div class="cart-item-name">${item.name}</div>
                <div class="cart-item-price">$${item.price.toFixed(2)} each</div>
            </div>
            <div class="cart-item-quantity">
                <button class="quantity-btn" onclick="updateQuantity(${item.id}, -1)">-</button>
                <span>${item.quantity}</span>
                <button class="quantity-btn" onclick="updateQuantity(${item.id}, 1)">+</button>
            </div>
            <button class="remove-item" onclick="removeFromCart(${item.id})">Remove</button>
        `;
        
        cartItemsContainer.appendChild(cartItem);
    });
    
    const total = cart.reduce((sum, item) => sum + (item.price * item.quantity), 0);
    cartTotal.textContent = `$${total.toFixed(2)}`;
}

// Checkout function
function checkout() {
    if (cart.length === 0) {
        alert('Your cart is empty!');
        return;
    }
    
    const total = cart.reduce((sum, item) => sum + (item.price * item.quantity), 0);
    alert(`Thank you for your purchase!\n\nTotal: $${total.toFixed(2)}\n\nThis is a demo checkout. In a real store, you would be redirected to a payment page.`);
    
    // Clear cart
    cart = [];
    updateCartUI();
    saveCartToStorage();
    closeCartModal();
}

// Handle contact form submission
function handleContactForm() {
    const name = document.getElementById('name').value;
    const email = document.getElementById('email').value;
    const message = document.getElementById('message').value;
    
    // In a real application, you would send this data to a server
    alert(`Thank you for your message, ${name}!\n\nWe'll get back to you at ${email} soon.`);
    
    // Reset form
    document.getElementById('contactForm').reset();
}

// Save cart to localStorage
function saveCartToStorage() {
    localStorage.setItem('techStoreCart', JSON.stringify(cart));
}

// Load cart from localStorage
function loadCartFromStorage() {
    const savedCart = localStorage.getItem('techStoreCart');
    
    if (savedCart) {
        cart = JSON.parse(savedCart);
        updateCartUI();
    }
}

// Show notification
function showNotification(message) {
    // Create notification element
    const notification = document.createElement('div');
    notification.style.cssText = `
        position: fixed;
        top: 100px;
        right: 20px;
        background-color: #10b981;
        color: white;
        padding: 1rem 1.5rem;
        border-radius: 8px;
        box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
        z-index: 3000;
        animation: slideInRight 0.3s ease-out;
    `;
    notification.textContent = message;
    
    // Add animation
    const style = document.createElement('style');
    style.textContent = `
        @keyframes slideInRight {
            from {
                transform: translateX(100%);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }
    `;
    document.head.appendChild(style);
    
    document.body.appendChild(notification);
    
    // Remove after 3 seconds
    setTimeout(() => {
        notification.style.animation = 'slideInRight 0.3s ease-out reverse';
        setTimeout(() => notification.remove(), 300);
    }, 3000);
}

// Make functions globally accessible for onclick handlers
window.removeFromCart = removeFromCart;
window.updateQuantity = updateQuantity;