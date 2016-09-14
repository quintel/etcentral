# The ETM API: Our engine in your model

Building your own energy-related model and interested to see how it affects the energy system in a particular market? By using the ETM API you can basically put our engine in your model. Our API is JSON-based and doesn't require any authentication. Simply send an appropriately formatted HTTP request to <code>https://engine.energytransitionmodel.com/api/v3/</code> and process the response message within your own model.

Below you find information on the requests available, their format and options as well as the structure of the response message you will receive. In case of further questions regarding our API, please contact us via [info@quintel.com](mailto:info@quintel.com) and make sure you put **'ETM API'** in your mail's subject.

<nav>
  <table class="table table-bordered table-condensed table-hover">
    <thead>
      <tr>
        <th>Sections</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><a href="#area_data">Area data</td>
      </tr>
      <tr>
        <td><a href="#scenarios">Scenarios</td>
      </tr>
      <tr>
        <td><a href="#inputs">Inputs</td>
      </tr>
      <tr>
        <td><a href="#converters">Converters</td>
      </tr>
    </tbody>
  </table>
</nav>  


<h2 class="anchor"><span id="area_data"></span>Area data</h2>

The ETM currently covers three European national markets - The Netherlands, Germany and the United Kingdom (test). Two API calls are available to obtain any market-specific parameters, as used by the ETM.

### GET /areas/

This call provides you with all the market-specific parameters for each of the markets defined in the ETM. Apart from the three national markets currently active, this also includes all Dutch provinces.

<pre class="prettyprint lang-bash terminal">$ curl -i https://engine.energytransitionmodel.com/api/v3/areas/</pre>

The response will be an JSON object with the following structure:

<pre class="prettyprint lang-bash">
[
  {
    "co2_price":0.00497,
    "man_hours_per_man_year":1800.0,
    "man_year_per_mj_insulation_per_year":3.28e-08,
    "useable":false,
    "areable_land":20.1,
    "available_land":53.0,
    "co2_emission_1990":0.0537,
    "co2_emission_2009":0.0544,
    "co2_emission_electricity_1990":0.01,
    "co2_percentage_free":0.85,
    "coast_line":57.0,
    "country":"ame",
    "created_at":"2010-10-12T13:40:30Z",
    "current_electricity_demand_in_mj":86099978,
    "el_export_capacity":0.0,
    "el_import_capacity":0.0,
    "entity":"",
    "export_electricity_primary_demand_factor":1.0,
    "has_agriculture":true,
    ...
  },{
    ...
  }
]
</pre>

### GET /areas/:country\_code

To obtain these parameters for a specific national (or local) market, add the country code to the url:

<pre class="prettyprint lang-bash terminal">$ curl -i https://engine.energytransitionmodel.com/api/v3/areas/nl</pre>

The response will be an JSON object with the following structure:

<pre class="prettyprint lang-bash">
{
  "co2_price":0.00497,
  "man_hours_per_man_year":1800.0,
  "man_year_per_mj_insulation_per_year":3.28e-08,
  "useable":true,
  "annual_infrastructure_cost_electricity":1810.0,
  "annual_infrastructure_cost_gas":1452.0,
  "areable_land":19175.4889,
  "available_land":19175.4889,
  "capacity_buffer_decentral_in_mj_s":20000.0,
  "capacity_buffer_in_mj_s":1600.0,
  "co2_emission_1990":151.2,
  "co2_emission_2009":165.1,
  "co2_emission_electricity_1990":39.92,
  "co2_percentage_free":0.85,
  "coast_line":451.0,
  "country":"nl",
  "created_at":"2010-05-18T14:09:51Z",
  "current_electricity_demand_in_mj":403061950508,
  "economic_multiplier":1.0,
  "el_export_capacity":16200000.0,
  "employment_fraction_production":0.5,
  "employment_local_fraction":0.2,
  "entity":"",
  "export_electricity_primary_demand_factor":1.0,
  "has_agriculture":true
  ...
}
</pre>

<p class="back_to_top"><a href="#">Back to top</a></p>

<h2 class="anchor"><span id="scenarios"></span>Scenarios</h2>

Using the API, one can inspect, create and change scenarios. These scenarios can be built from scratch or based on an existing scenario or template.

### GET /scenarios/:id

Provided the `:id` of the scenario is known, a basic description of the scenario can be obtained.

<pre class="prettyprint lang-bash terminal">$ curl -i https://engine.energytransitionmodel.com/api/v3/scenarios/123456</pre>

The response will be an JSON object with the following structure:

<pre class="prettyprint lang-bash">
HTTP/1.1 200 OK

{
  "id":123456,
  "title":"ETM API demo",
  "area_code":"nl",
  "end_year":2050,
  "url":"https://engine.energytransitionmodel.com/api/v3/scenarios/123456",
  "ordering":null,
  "display_group":null,
  "source":"ETM",
  "template":123000,
  "created_at":"2013-05-31T15:07:26+02:00"
}
</pre>

Using the `detailed=true` option, a more elaborate description is obtained, as well as an overview of all the modified inputs.

<pre class="prettyprint lang-bash terminal">$ curl -i https://engine.energytransitionmodel.com/api/v3/scenarios/123456?detailed=true</pre>

The response will be an JSON object with the following structure:

<pre class="prettyprint lang-bash">
HTTP/1.1 200 OK

{
  "id":123456,
  "title":"ETM API demo",
  "area_code":"nl",
  "end_year":2050,
  "url":"https://engine.energytransitionmodel.com/api/v3/scenarios/123456",
  "ordering":null,
  "display_group":null,
  "source":"ETM",
  "template":123000,
  "created_at":"2013-05-31T15:07:26+02:00",
  "use_fce":false,
  "user_values":{
    "policy_sustainability_co2_emissions":-79.2,
    "policy_sustainability_renewable_percentage":79.6,
    "policy_dependence_max_dependence":24.1,
    ...
  }
}
</pre>

### GET /scenarios/templates

The ETM offers a set of scenarios, so-called 'templates', which can be used to base one's scenario on. In order to get a list of these templates, including an extensive HTML description in both Dutch and English, one can use this API call:

<pre class="prettyprint lang-bash terminal">$ curl -i https://engine.energytransitionmodel.com/api/v3/scenarios/templates</pre>

The response will be an JSON object with the following structure:

<pre class="prettyprint lang-bash">
HTTP/1.1 200 OK

[
  {
    ...
  },{
    "id":149765,
    "title":"Anton Broenink - GasTerra",
    "area_code":"nl",
    "end_year":2030,
    "description":"&lt;span class='nl'&gt;...&lt;/span&gt;&lt;span class='en'&gt;...&lt;/span&gt;",
    "url":"https://engine.energytransitionmodel.com/api/v3/scenarios/149765",
    "ordering":null,
    "display_group":"Watt Nu?! 2013"
  },{
    "id":155680,
    "title":"Het kan als je het wilt! 98% Duurzame Energie",
    "area_code":"nl",
    "end_year":2030,
    "description":"&lt;span class='nl'&gt;...&lt;/span&gt;&lt;span class='en'&gt;...&lt;/span&gt;",
    "url":"https://engine.energytransitionmodel.com/api/v3/scenarios/155680",
    "ordering":null,
    "display_group":"Overig"
  }
]
</pre>

### POST /scenarios

A new scenario is created by sending a POST request, along with some optional data in the message body. The options are as follows:

* `area_code`: optional string, default: `nl`
* `title`: optional string, default: `API`
* `end_year`: optional integer, default: `2040`
* `source`: optional (but highly recommended) string, identifying the application that makes the request
* `scenario_id`: optional id of the scenario used as template

<pre class="prettyprint lang-bash terminal">$ curl -i -X POST -H "Content-Type: application/json" -d '{"scenario": {"title": "My scenario", "end_year": "2030"}}' https://engine.energytransitionmodel.com/api/v3/scenarios</pre>

The response will be an JSON object with the following structure:

<pre class="prettyprint lang-bash">
HTTP/1.1 200 OK

{
  "id":123456,
  "title":"My scenario",
  "area_code":"nl",
  "end_year":2030,
  "url":"https://engine.energytransitionmodel.com/api/v3/scenarios/123456",
  "ordering":null,
  "display_group":null,
  "source":null,
  "template":null,
  "created_at":"2013-08-13T14:30:10+02:00"
}
</pre>

### PUT /scenarios/:id

Using a PUT request, one can make changes to a scenario's inputs, comparable to moving a slider in the web interface. Other options include resetting a scenario and running one or more gqueries.

* `scenario`: hash with the scenario attributes. Its `user_values` are merged
  with the existing values, because otherwise the entire input sets should be
  resent on every request. The `user_values` must be sent as a hash; the hash
  key is the input key. If you pass `reset` as the value for a single input then the input will be... reset.
* `gqueries`: optional array of gqueries to run
* `detailed`: optional boolean. If true then the `scenario` object response
  will contain extra information such as `use_fce` and `user_values`
* `reset`: optional boolean (default: false). If true the scenario inputs will
  first be reset. This means that the scenario will use only the inputs we're
  passing with the current request.

#### Example 1: Changing scenario parameters

<pre class="prettyprint lang-bash terminal">$ curl -i -X PUT -H "Content-Type: application/json" -d '{"scenario": {"title": "My test scenario", "end_year": "2030"}}' https://engine.energytransitionmodel.com/api/v3/scenarios/123456</pre>

The response will be an JSON object with the following structure:

<pre class="prettyprint lang-bash">
HTTP/1.1 200 OK

{
  "scenario": {
    "id":123456,
    "title":"My test scenario",
    "area_code":"nl",
    "end_year":2030,
    "url":"https://engine.energytransitionmodel.com/api/v3/scenarios/123456",
    "ordering":null,
    "display_group":null,
    "source":null,
    "template":null,
    "created_at":"2013-08-13T14:30:10+02:00"
  },
  "gqueries": {}
}
</pre>

#### Example 2: Setting scenario inputs

<pre class="prettyprint lang-bash terminal">$ curl -i -X PUT -H "Content-Type: application/json" -d '{"scenario": {"user_values": {"employment_local_fraction": 10}},"detailed": true }' https://engine.energytransitionmodel.com/api/v3/scenarios/123456</pre>

The response will be an JSON object with the following structure:

<pre class="prettyprint lang-bash">
HTTP/1.1 200 OK

{
  "scenario": {
    "id":123456,
    "title":"My test scenario",
    "area_code":"nl",
    "end_year":2030,
    "url":"https://engine.energytransitionmodel.com/api/v3/scenarios/123456",
    "ordering":null,
    "display_group":null,
    "source":null,
    "template":null,
    "created_at":"2013-08-13T14:30:10+02:00"
    "user_values": {
      "employment_local_fraction": 10
    }
  },
  "gqueries": {}
}
</pre>

#### Example 3: Running gqueries

<pre class="prettyprint lang-bash terminal">$ curl -i -X PUT -H "Content-Type: application/json" -d '{"gqueries": ["gquery_1","gquery_2"] }' https://engine.energytransitionmodel.com/api/v3/scenarios/123456</pre>

The response will be an JSON object with the following structure:

<pre class="prettyprint lang-bash">
HTTP/1.1 200 OK

{
  "scenario": {
    ...
  },
  "gqueries": {
    "gquery_1": {
      "present": 123,
      "future": 456,
      "unit": "MJ"
    },
    "gquery_2": {
      "present": 123,
      "future": 456,
      "unit": "euro"
    }
  }
}
</pre>

A list of available gqueries can be found [here](#)

<p class="back_to_top"><a href="#">Back to top</a></p>

<h2 class="anchor"><span id="inputs"></span>Inputs</h2>

### GET /inputs (also GET /scenarios/:scenario\_id/inputs)

To get an overview of all the inputs available in the ETM, complete with their minimum, maximum and default values and unit, one should make the following request:

<pre class="prettyprint lang-bash terminal">$ curl -i https://engine.energytransitionmodel.com/api/v3/inputs</pre>

The response will be an JSON object with the following structure:

<pre class="prettyprint lang-bash">
HTTP/1.1 200 OK

{
  "employment_local_fraction":{
    "min":0.0,
    "max":100.0,
    "default":20.0
  },
  "employment_fraction_production":{
    "min":0.0,
    "max":90.0,
    "default":50.0
  },
  "employment_economic_multiplier":{
    "min":1.0,
    "max":3.0,
    "default":1.0
  },
  "co_firing_wood_pellets_share":{
    "min":0.0,
    "max":50.0,
    "default":12.0213247848357,
    "share_group":"coal_plant_fuel"
  },
  ...
}
</pre>

### GET /inputs/:code (also GET /scenarios/:scenario\_id/inputs/:code)

To inspect individual inputs and learn about the applicable unit, one simply add the input's key to the url:

<pre class="prettyprint lang-bash terminal">$ curl -i https://engine.energytransitionmodel.com/api/v3/inputs/employment_local_fraction</pre>

The response will be an JSON object with the following structure:

<pre class="prettyprint lang-bash">
HTTP/1.1 200 OK

{
  "min":0.0,
  "max":100.0,
  "default":20.0,
  "step":0.1,
  "code":"employment_local_fraction",
  "unit":"%"
}
</pre>

<p class="back_to_top"><a href="#">Back to top</a></p>

<h2 class="anchor"><span id="converters"></span>Converters</h2>

The ETM peruses a complex graph to calculate energy flows. Each of the 250+ nodes of this graph is a so-called 'converter' as it converts one or more incoming flows into one or more outgoing flows. While the graph configuration itself is fixed, each of the nodes can be inspected individually. 

### GET /converters/:code (also GET /scenarios/:scenario\_id/converters/:code)

To inspect an individual converter, one should make the following request:

<pre class="prettyprint lang-bash terminal">$ curl -i https://engine.energytransitionmodel.com/api/v3/converters/industry_chp_combined_cycle_gas_power_fuelmix</pre>

The response will be an JSON object with the following structure:

<pre class="prettyprint lang-bash">
HTTP/1.1 200 OK

{
  "key":"industry_chp_combined_cycle_gas_power_fuelmix",
  "sector":"industry",
  "use":"energetic",
  "groups":["must_run_electricity_production","cost_chps","electricity_production"],
  "energy_balance_group":"central CHPs",
  "data":{
    "Technical":{
      "electricity_output_capacity":{
        "present":99.99994,
        "future":99.99994,
        "unit":"MW",
        "desc":"Nominal electrical capacity"
      },
      ...
    },
    "Cost":{
      "initial_investment_per(:mw_electricity)":{
        "present":1050000.630000378,
        "future":1050000.630000378,
        "unit":"euro / MWe",
        "desc":"Initial investment (excl CCS)"
      },
      ...
    },
    "Other":{
      "land_use_per_unit":{
        "present":0.1,
        "future":0.1,
        "unit":"km2",
        "desc":"Land use per unit"
      },
      ...
    }
  },
  "uses_coal_and_wood_pellets":false
}
</pre>


### GET /converters/topology (also GET /scenarios/:scenario\_id/converters/topology)

Although the primary internal use of this request is to produce a visualisation of the graph, it could be used to learn the names of the 250+ converters and their interrelationships. Alternatively, you may contact us via [info@quintel.com](mailto:info@quintel.com), stating 'ETM API' in the subject line of your mail.

<pre class="prettyprint lang-bash terminal">$ curl -i https://engine.energytransitionmodel.com/api/v3/converters/topology</pre>

<p class="back_to_top"><a href="#">Back to top</a></p>