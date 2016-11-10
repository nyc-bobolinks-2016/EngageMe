class MyChart extends React.Component {
  constructor() {
    super()
  }
  render(){
    var ctx = document.getElementById("myChart");
    var ctx = document.getElementById("myChart").getContext("2d");
    var ctx = $("#myChart");
    return(
      <canvas id="myChart" width="400" height="400"></canvas>
    )
  }
}
