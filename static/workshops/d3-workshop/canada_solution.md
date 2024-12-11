```javascript
(function() {
        var proj = d3.geo.albers(), // type of projection
          path = d3.geo.path().projection(proj); // get path generator from projection

        var profiles = {};

        d3.json("provinces.json", function(canada) {
          d3.csv("census-profile.csv", function(profile) {
            profile.forEach(function(provinceProfile) {
              profiles[provinceProfile.Prov_Name] = provinceProfile;
            });
            d3.json("elections.json", function(electionResultsJson) {
              ready(canada, profiles, electionResultsJson);
            });
          });
        });

        function ready(canada, profiles, electionsData) {
          var provinces = d3
            .select("#canvas")
            .append("g")
            .attr("class", "provinces")
            .selectAll("path")
            .data(topojson.object(canada, canada.objects.provinces).geometries)
            .enter()
            .append("path")
            .attr("class", "province")
            .attr("d", path)
            .attr("transform", "translate(0,250)scale(0.5,0.5)")
            .on("mouseover", function(data) {
              var provinceName = profiles[data.id].Prov_Name;
              var parties = Object.values(
                electionsData[provinceName].parties
              ).map(
                party => `${party.party}: ${party.seats} (${party.percentage}%)`
              );
              d3.select("#results-box").html(
                `<h1>${provinceName}</h1>` + "<br/>" + parties.join("<br/>")
              );
            })
            .on("mouseout", function(data) {
              d3.select("#results-box").html("");
            });
        }
      })();

```
