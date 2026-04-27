db.sales.aggregate([
    {
        $match: {
            date: {
                $gte: ISODate("2026-04-21T00:00:00Z"),
                $lt: ISODate("2026-04-22T00:00:00Z")
            }

        }
    },
    {
        $project: {
            _id: 0,
            product: 1,
            price: 1,
            qty: 1,
            grandTotal: {
                $multiply: ["$price", "$qty"]
            },
            tax: {
                $multiply: [.12, { $multiply: ["$price", "$qty"] }]
            }
        }
    },
    {
        $sort: {grandTotal : -1},
    },
    {
        $skip: 2
    },
    {
        $limit: 1
    }
]);
