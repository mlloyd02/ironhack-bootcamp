  function showGraphMonth(valences, arousals, days) {

    new Chartist.Line('.ct-chart-month', {
      labels: days,
      series: [
        valences,
        arousals
      ]
    }, {
      high: 1,
      low: -1,
      showArea: true,
      showLine: false,
      showPoint: false,
      fullWidth: true,
      chartPadding: {
        right: 40
      }
    });

  }

  function showGraphWeek(valences, arousals, days) {

    new Chartist.Line('.ct-chart-week', {
      labels: days,
      series: [
        valences,
        arousals
      ]
    }, {
      high: 1,
      low: -1,
      showArea: true,
      showLine: false,
      showPoint: false,
      fullWidth: true,
      chartPadding: {
        right: 40
      }
    });

  }