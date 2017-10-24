document.addEventListener("turbolinks:load", function() {
$input = $("[data-behavior='autocomplete']")
  var options = {
        url: "/search.json",

    categories: [{
        listLocation: "machine",
        header: "Choose Machine:"
    }],

    getValue: function(element) {
        return element.name;
    },

    // template: {
    //     type: "description",
    //     fields: {
    //         description: "description"
    //     }
    // },

    list: {
        maxNumberOfElements: 8,
        match: {
            enabled: true
        },
        sort: {
            enabled: true
        },
    
        showAnimation: {
            type: "fade", //normal|slide|fade
            time: 400,
            callback: function() {}
        },

        hideAnimation: {
            type: "slide", //normal|slide|fade
            time: 400,
            callback: function() {}
        }
},

    theme: "square"
};

$input.easyAutocomplete(options);

});