class WeatherModel {
    WeatherModel({
        this.product,
        this.init,
        this.dataseries,
    });

    String? product;
    String? init;
    List<Datasery>? dataseries;

    factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        product: json["product"],
        init: json["init"],
        dataseries: List<Datasery>.from(json["dataseries"].map((x) => Datasery.fromJson(x))),
    );
}

class Datasery {
    Datasery({
        this.timepoint,
        this.cloudcover,
        this.seeing,
        this.transparency,
        this.liftedIndex,
        this.rh2M,
        this.wind10M,
        this.temp2M,
        this.precType,
    });

    int? timepoint;
    int? cloudcover;
    int? seeing;
    int? transparency;
    int? liftedIndex;
    int? rh2M;
    Wind10M? wind10M;
    int? temp2M;
    String? precType;

    factory Datasery.fromJson(Map<String, dynamic> json) => Datasery(
        timepoint: json["timepoint"],
        cloudcover: json["cloudcover"],
        seeing: json["seeing"],
        transparency: json["transparency"],
        liftedIndex: json["lifted_index"],
        rh2M: json["rh2m"],
        wind10M: Wind10M.fromJson(json["wind10m"]),
        temp2M: json["temp2m"],
        precType: json["prec_type"],
    );
}

class Wind10M {
    Wind10M({
        this.direction,
        this.speed,
    });

    String? direction;
    int? speed;

    factory Wind10M.fromJson(Map<String, dynamic> json) => Wind10M(
        direction: json["direction"],
        speed: json["speed"],
    );
}
