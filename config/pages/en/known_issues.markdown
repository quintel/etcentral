# Known issues

## Interface / Website

* Internet Explorer 7 and 8 have been known to give errors and not load several charts. These old browsers are not or not fully supported.

## Energy calculations

* Geothermal heat, ambient heat (air and ground heat pumps), and solar thermal energy are not included in the primary energy calculation. The effect is that technologies using these reduce the amount of energy used. We plan to include those primary renewable carriers in the renewability calculation if international energy statistics reach a consensus on how to do this.
* The ETM only takes into account *net* energy flows. Energy which is *transported through* a country (imported and then exported again) is not included.
* Currently the only power plants which can be used for co-firing of wood_pellets are the ultra-supercritical pulverized coal power plant (Pulverized coal) and the equivalent CHP plant (Central Coal CHP).
* Hydrogen and (bio-)LNG for transport are modelled in more detail than other transport fuels; we have included realistic efficiencies for the full transport chain (from fuel production to utilization) for hydrogen and (bio) LNG, but still need to include those for the other fuels. As a result, transport technologies running on these other fuels appear relatively more efficient in the ETM than they are in reality.

## CO2 calculations
* CO2 emissions for electricity produced by diesel engines is currently overestimated if refineries producing diesel are present in the dataset. In that case the energy use (final demand) of the refinery sector (and associated CO2 emissions) is fully included in the final demand of the industry sector and (partially) included in the primary demand of the diesel used by diesel engines.

## Cost calculations

* Cars are not given investment costs as we do not consider buying a car to be part of the energy system costs. Instead, it is possible to specify additional investment costs for electric vehicles (with respect to conventional internal combustion engine cars).
* We are currently still validating costs for certain power plants (coal-fired, hydro and nuclear power plants) and household and building heating technologies. These may therefore result in over or underestimated costs.


## Merit order module

* The power plants in the ETM include both state-of-the-art and more conventional technologies, whose properties are chosen such as to reproduce the national energy balance correctly (both production of electricity and transformation losses). These plant types are a simplification of the real production park installed in the Netherlands. Profitability figures of the plants in the ETM should, therefore, not be translated one-on-one to plants currently exisiting in the Netherlands.

* The flexibility calculation uses the physical interconnector capacity to determine how much electricity can be exported at any time. The interconnector capacity can be set using a slider, which is currently initialized at the interconnector capacity for The Netherlands. This Dutch interconnector capacity is used for all other countries as well. You can, however, set the correct interconnector capacity for these countries using the slider. The slider will be properly initialized for the other countries in a future release of the ETM.
