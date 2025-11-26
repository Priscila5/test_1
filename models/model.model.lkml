connection: "afluencia_movilidad"
include: "/views/**/*.view.lkml"

datagroup: model_default_datagroup { max_cache_age: "1 hour" }
persist_with: model_default_datagroup

# Explores base de las tablas originales (opcional)
explore: compras_internacionales_eu {}
explore: compras_internacionales_ch {}
explore: destino_compras_eu {}
explore: destino_compras_ch {}
explore: flujo_eu_a_m {}
explore: flujo_china_a_m {}
explore: calendario_mensual {}
explore: flujo_union {}
