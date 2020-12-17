function add_to_cart(pId, pName, pPrice) {
    let cart = localStorage.getItem("cart");
    if (cart == null)
    {
        let products = [];
        let product = {
            productId: pId,
            productName: pName,
            productQuantity: 1,
            productPrice: pPrice
        }
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        console.log("product addedd 1st time")
        showToast("Item is added to cart")
    } else {
        let pcart = JSON.parse(cart);
        let oldproduct = pcart.find((item) => item.productId == pId)
        if (oldproduct)
        {
            oldproduct.productQuantity = oldproduct.productQuantity + 1;
            pcart.map((item) => {
                if (item.productId == oldproduct.productId)
                {
                    item.productQuantity = oldproduct.productQuantity;
                }
            })
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("product quantity increased");
            showToast(oldproduct.productName + " quantity increased, Quantity = " + oldproduct.productQuantity)
        } else {
            let product = {
                productId: pId,
                productName: pName,
                productQuantity: 1,
                productPrice: pPrice
            }
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("product addedd");
            showToast("Product is added to cart")
        }
    }
    update_cart();
}

//update cart:

function update_cart() {
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    if (cart == null || cart.length == 0) {
        console.log("Cart is empty!!");
        $(".cart-items").html("(0)");
        $(".cart-body").html("<h3>Cart does not have any items</h3>");
        $(".checkout-btn").attr('disabled', true);
    } else {
        console.log(cart);
        $(".cart-items").html(`(${cart.length})`);
        let table = `
                    <table class="table">
                        <thead class="thead-light">
                            <tr>
                                <th>Item Name</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total Price</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                    
                  `;
        let totalPrice = 0;
        cart.map((item) => {
            table += `
                <tr>
                    <td>${item.productName}</td>
                    <td>${item.productPrice}</td>
                    <td><center>${item.productQuantity}</center></td>
                    <td>${item.productQuantity * item.productPrice}</td>
                    <td><button class="btn btn-danger btn-sm" onclick='deleteItemFromCart(${item.productId})'>Remove</button></td>
                </tr>
            `
            totalPrice += item.productQuantity * item.productPrice;
        });
        table = table +
                `
        <tr><td colspan='5' class="text-right" style="font-weight:bold;">Total Price : ${totalPrice}</td></tr>
        </table>`;
        $(".cart-body").html(table);
        $(".checkout-btn").attr('disabled', false);
    }
}

//remove cart
function deleteItemFromCart(pid) {
    let cart = JSON.parse(localStorage.getItem('cart'));
    let newCart = cart.filter((item) => item.productId != pid)
    localStorage.setItem('cart', JSON.stringify(newCart))
    update_cart();
    showToast("Item is removed from cart")
}
$(document).ready(function () {
    update_cart()
})


function showToast(content) {
    $("#toast").addClass("display");
    $("#toast").html(content);
    setTimeout(() => {
        $("#toast").removeClass("display");
    }, 2000);
}

function goToCheckOut() {
    window.location = "checkout.jsp";
}


