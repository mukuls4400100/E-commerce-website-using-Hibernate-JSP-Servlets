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
        }
    }

}

//update cart:

function update_cart() {
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    if (cart == null || cart.length == 0) {
        console.log("Cart is empty!!");
        $(".cart-items").html("(0)");
        $(".cart-body").html("<h3>Cart doesnot have any items</h3>");
        $(".checkout-btn").addClass('disabled');
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
                    </table>
                  `;
    }
}
$(document).ready(function () {
    update_cart();
});

