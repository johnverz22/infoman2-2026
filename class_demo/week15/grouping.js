// Find the total products, total stocks, average price for each category


db.products.aggregate([
    {
        $group: {
            //_id: "$brand", //group by brand
            _id: null,
            totalProducts: { $sum: 1}, //count()
            totalStock: { $sum: "$stock"}, //sum()
            avgPrice: { $avg: "$price"}
        }
    }
]);


// total value of the entire warehouse, number of units

db.products.aggregate([
    {
        $group:{
            _id: null,
            totalUnits: { $sum: "$stock"},
            totalWarehouseValue: { $sum: {$multiply: ["$price", "$stock"]} } 

        }

    }

]);


// group by category and brand to see which brands dominate each category by number of stock

db.products.aggregate([
    {
        $group: {
            _id: {
                category: "$category",
                brand: "$brand"
            },
            stockCount: {$sum: "$stock"}
        }
    }, 
    {
        $sort: { "_id.category": 1}
    }
])


// list unique brands per category


db.products.aggregate([
    {
        $group: {
            _id: "$category",
            brands: {$addToSet: "$brand"}
        }
    }
])

// list unique product per brand
db.products.aggregate([
    {
        $group: {
            _id: "$brand",
            products: {$addToSet: "$name"}
        }
    }
])