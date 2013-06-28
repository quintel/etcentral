## Currently known issues

### Interface / Website

* Internet Explorer 7 and 8 have been known to give errors and not load several charts. These old browsers are not or not fully supported.
* The slider 'washing machine' (in Demand > Households > Appliances) and the slider 'low-temperature washing' (in Demand > Households > Behavior) can affect each other incorrectly

### Energy calculations

* Geothermal heat, ambient heat (air and ground heat pumps), and solar thermal energy are not included in the primary energy calculation. The effect is that technologies using these reduce the amount of energy used. We plan to include those primary renewable carriers in the renewability calculation in order to match the international energy statistics.
* Primary demand of carriers can differ between Sankey and overall Primary and Final energy use charts by small amounts. These discrepancies will be resolved in the next version of the ETM.
* Currently the only power plants which can be used for co-firing of wood_pellets are the ultra-supercritical pulverized coal power plant (Pulverized coal) and the equivalent CHP plant (Central Coal CHP).
* The technical specs and installed capacities of CHP plants have been updated. For the Netherlands, the heat and electricity balances have been updated accordingly, but for Germany and the UK this has not yet been done. The heat and electricity production for these countries can therefore deviate from the actual values. In fact, we know that CHP plants in Germany produce roughly 100 PJ too little heat leading to small (of order 1%) deviations in renewability percentage and CO2 reduction percentage.
* Insulation in the Buildings sector competes with 'recirculation' and 'heat recovery' (in that order) as means to reduce the heat demand in the ETM. In reality, these techniques are all applied simultaneously. The simplification used in the ETM does not change the joint effect, but can result in incorrect relative effect of these techniques.

### Cost calculations

*As yet, kerosene and heavy fuel oil have no extra refinery costs (on top of crude oil). These will be analyzed and resolved in one of the next versions.
* We are currently still validating costs for certain power plants (coal-fired, hydro and nuclear power plants) and household and building heating technologies. These may therefore result in incorrect costs.
* We are currently overhauling all Combined Heat and Power plants in the ETM. We expect this to be finished by the end of September. This will affect both energy and cost calculations.
* Costs of insulation are currently related to the amount of energy that is saved by insulating. Because this amount depends on both the 'heat demand per person' and 'outdoor temperature' slider settings, the cost of insulation (incorrectly) depends on these settings as well.
* The cost calculation for insulation in the ETM is based on the simplifying assumption that costs scale linearly with saved energy. This approximation will overestimate the costs for low degrees of insulation, and underestimate the costs for high insulation values. The reason is that, in reality, cost-effective measures are applied first, while the last few percent of savings require large investments. We have planned a complete overhaul of this part of the ETM which will improve the cost calculation for insulation considerably.

### Fuel chain emission calculations

* Crude oil, biogas and wood pellets are currently not taken into account in the FCE calculation.

### Employment module

* Industry and agriculture are excluded from the employment calculation.
* At present, geothermal heating in Households and Buildings uses employment figures from geothermal electricity production (scaled to match the capacity). This is due to the lack of literature on geothermal heating projects in the Netherlands.
* Employment effects of district heating do not take the construction of a heat network into account. The extent and properties of such a network are too dependent on the specifics of each project, to conclude what impact the network has on employment.
* The 'Replacement of existing houses' slider does not take into account that heating or cooling technologies need to be installed for each new house. The effect of this slider on employment is therefore unrealistically small.
* To assess the employment impact of CCS technologies we have added 30% to the impact of the 'planning', 'production', 'placement' and 'removal' stages and 70% to 'maintenance' compared to the reference non-CCS technologies.
* The employment impact of maintenance for offshore wind turbines has been taken from onshore wind research.
* The following technologies are not included in the employment calculation:
  * The hydropower plants (both river and mountain)
  * Central burners for heat generation in the Supply section (coal, gas, biomass and waste-fired)
  * Appliances (washing machines, stereos etc.)
  * Ventilation, recirculation en heat recovery

### Merit order module

* The merit order calculation does not take import or export of electricity into account. This means that plants experience no competition from cheap electricity from abroad. In reality, North Western Europe's electricity market is coupled and such competition does exist. As a result of this simplification, the profitability of most plants is significantly overestimated. In order to see how cheap renewables or coal from e.g. Germany affect profitability, the user may consider to increase installed capacity of such plants in the Netherlands.
 
* The power plants in the ETM include both state-of-the-art and more conventional technologies, whose properties are chosen such as to reproduce the national energy balance correctly (both production of electricity and transformation losses). These plant types are a simplification of the real production park installed in the Netherlands. Profitability figures of the plants in the ETM should, therefore, not be translated one-on-one to plants currently exisiting in the Netherlands.