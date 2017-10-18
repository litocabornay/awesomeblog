document.addEventListener("turbolinks:load", function() {
$input = $("[data-behavior='autocomplete']")
  var options = {
        url: "/search.json",

    categories: [{
        listLocation: "machine",
        header: "Machine Name"
    }],

    getValue: function(element) {
        return element.name;
    },

    template: {
        type: "description",
        fields: {
            description: "name"
        }
    },

    list: {
        maxNumberOfElements: 8,
        match: {
            enabled: true
        },
        sort: {
            enabled: true
        }
    },

    theme: "square"
};

$input.easyAutocomplete(options);

});