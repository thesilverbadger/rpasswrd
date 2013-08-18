var generatorServer = (function () {

    //temporary error handler
    $(document).ajaxError(function (event, xhr) {
        alert('error');
    });

    var getCode = function () {

        return $.ajax(_apiUrl);
    };

    return {
        getCode: getCode,
    }

}());

(function ($) {

    generator = function (options) {
        this._init(options);
    };

    var _generator = null;

    generator.prototype = {
        _apiUrl: "",

        options: {
            apiUrl: "",
        },

        _init: function (options) {
            var self = this;
            _generator = this;
            $.extend(true, self.options, options);

            _apiUrl = '/generate';
            _generator.wireEvents();
        },

        wireEvents: function () {
            $(document).on("click", "#generate", function(){

                generatorServer.getCode().done(function(data){
                    $('#code_password').val(data.randomCode);
                });
            });
        },
    }

})(jQuery);