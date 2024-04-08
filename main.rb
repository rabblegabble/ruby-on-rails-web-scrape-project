require_relative 'webscrape.rb'


def starting_tags(html)
  html.write('<!DOCTYPE html>
  <html lang="en">
  <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>CSE 3901 Project-3</title>
      <link rel="stylesheet" type="text/css" href="style.css">
      <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
      <div id="chartContainer" style="height: 370px; width: 100%;"></div>
      <script src="https://canvasjs.com/assets/script/canvasjs.min.js"> </script>
  </head>
  <body>
      <div class="header" style="margin-bottom:25px">
          <h1>OSU Facts</h1>
          <input type="text" placeholder="Search..."></div>')
end

def display_enrollment(html, scraper)

  enrollment_table = scraper.get_enrollment
  
  html.write('<div class="slider-item">')
  html.write('<h2>Enrollment</h2>')
  html.write('</div>')
  
  html.write('<table class ="table" id="enrollment_table"')
  html.write(enrollment_table)
  html.write('</table>')

  #use canvas tag to display graph need to add canvas id
  html.write('<div class="chart"><canvas id="gender"></canvas></div>')
  html.write('<div class="chart"><canvas id="level"></canvas></div>')
  html.write('<div class="chart"><canvas id="race"></canvas></div>')
  
  #Use javascript to create a graph of the table

  # Pie chart of gender for total university
  html.write('<script>')
  html.write('var enr = document.getElementById(enrollment_table);')  
  html.write('window.onload = function () {
    var gender = new CanvasJS.Chart("chartContainer", {
    title: {
      text: "Gender by Campus"
    },
    data: [{
      type: "pie",
      yValueFormatString: "##0.00\"%\"",
      indexLabel: "{label} {y}",
      dataPoints: [
        
      ]
    }]
  });
  
  gender.render();
  }')

  html.write('<div id="chartContainer" style="height: 370px; width: 100%;"></div>')

  # Bar chart for level for total university -- fill in actual data points
  html.write('window.onload = function () {
    var level = new CanvasJS.Chart("chartContainer", {
    title:{
      text: "Enrollment by Level"
    },
    axisY: {
      title: "Students Enrolled",
      includeZero: true
    },
    legend: {
      cursor:"pointer",
      itemclick : toggleDataSeries
    },
    toolTip: {
      shared: true,
      content: toolTipFormatter
    },
    data: [{
      type: "column",
      showInLegend: true,
      name: "Undergraduate",
      color: "red",
      dataPoints: [
        {y: 300878, label: "Columbus Campus" },
			  { y: 266455,  label: "Total" }
      ]
    },
    {
      type: "column",
      showInLegend: true,
      name: "Graduate",
      color: "gray",
      dataPoints: [
        {y: 300878, label: "Columbus Campus" },
			  { y: 266455,  label: "Total" }
      ]
    },
    {
      type: "column",
      showInLegend: true,
      name: "Professional",
      color: "black",
      dataPoints: [
        { y: 300878, label: "Columbus Campus" },
			  { y: 266455,  label: "Total" }
      ]
    }]
  });
  
  level.render();
  }')

  html.write('window.onload = function () {
    var residency = new CanvasJS.Chart("chartContainer", {
    title:{
      text: "Enrollment by Residency"
    },
    axisY: {
      title: "Students Enrolled",
      includeZero: true
    },
    legend: {
      cursor:"pointer",
      itemclick : toggleDataSeries
    },
    toolTip: {
      shared: true,
      content: toolTipFormatter
    },
    data: [{
      type: "column",
      showInLegend: true,
      name: "Resident",
      color: "red",
      dataPoints: [
        {y: 300878, label: "Columbus Campus" },
			  { y: 266455,  label: "Total" }
      ]
    },
    {
      type: "column",
      showInLegend: true,
      name: "Non-Resident",
      color: "gray",
      dataPoints: [
        {y: 300878, label: "Columbus Campus" },
			  { y: 266455,  label: "Total" }
      ]
    },
    {
      type: "column",
      showInLegend: true,
      name: "Professional",
      color: "Foreign",
      dataPoints: [
        { y: 300878, label: "Columbus Campus" },
			  { y: 266455,  label: "Total" }
      ]
    }]
  });
  residency.render();
  }')

  html.write('window.onload = function () {
    var race = new CanvasJS.Chart("chartContainer", {
    animationEnabled: true,
    title:{
      text: "Enrollment by Race"
    },
    axisY: {
      suffix: "%"
    },
    toolTip: {
      shared: true
    },
    legend: {
      reversed: true,
      verticalAlign: "center",
      horizontalAlign: "right"
    },
    data: [{
      type: "stackedColumn100",
      name: "White",
      showInLegend: true,
      dataPoints: [
        {x: "Columbus campus", y: .257},
        {x: "Total University", y: .257},
      ]
    }, 
    {
      type: "stackedColumn100",
      name: "African Americans",
      showInLegend: true,
      dataPoints: [
        {x: "Columbus campus", y: .257},
        {x: "Total University", y: .257},
      ]
    }, 
    {
      type: "stackedColumn100",
      name: "Asian Americans",
      showInLegend: true,
      dataPoints: [
        {x: "Columbus campus", y: .257},
        {x: "Total University", y: .257},
      ]
    },
    {
      type: "stackedColumn100",
      name: "Hispanics",
      showInLegend: true,
      dataPoints: [
        {x: "Columbus campus", y: .257},
        {x: "Total University", y: .257},
      ]
    },
    {
      type: "stackedColumn100",
      name: "Two or More Races",
      showInLegend: true,
      dataPoints: [
        {x: "Columbus campus", y: .257},
        {x: "Total University", y: .257},
      ]
    },
    {
      type: "stackedColumn100",
      name: "American Indian/Alaskan Native",
      showInLegend: true,
      dataPoints: [
        {x: "Columbus campus", y: .257},
        {x: "Total University", y: .257},
      ]
    },
    {
      type: "stackedColumn100",
      name: "Native Hawaiian/Pacific",
      showInLegend: true,
      dataPoints: [
        {x: "Columbus campus", y: .257},
        {x: "Total University", y: .257},
      ]
    },]
  });
  race.render();
  }')

  html.write('</script>')
end

def display_academicStructure(html, scraper)
  academicStructure_table = scraper.get_academicStructure
  html.write('<div class="slider-item">')
  html.write('<h2>Academic Structure</h2>')
  html.write('</div>')
  html.write('<table class ="table" id="AcademicStructure_table"')
  html.write(academicStructure_table)
  html.write('</table>')

  #use canvas tag to display graph need to add canvas id
  html.write('<div class="chart"><canvas id=""></canvas></div>')
  
  #Use javascript to create a graph of the table
  html.write('<script>')
  
  #javascript code goes here we could create a seperate function for 
  #this and call it here
  html.write('</script>')
end

def display_tuitionAndFees(html, scraper)
  tuitionAndFees_table = scraper.get_tuitionAndFees
  html.write('<div class="slider-item">')
  html.write('<h2>Tuition and Fees</h2>')
  html.write('</div>')
  html.write('<table class ="table" id="tuitionAndFees_table"')
  html.write(tuitionAndFees_table)
  html.write('</table>')

  #use canvas tag to display graph need to add canvas id
  html.write('<div class="chart"><canvas id="tuition"></canvas></div>')
  
  #Use javascript to create a graph of the table
  html.write('<script>')
  
  # Bar chart of annual tuition
  html.write('window.onload = function () {
  var tuition = new CanvasJS.Chart("chartContainer", {
	animationEnabled: false,
	
	title:{
		text:"Tuition and Fees"
	},
	axisX:{
		interval: 1
	data: [{
		type: "bar",
		name: "Annual Tuition",
		color: "red",
		dataPoints: [
			{ y: 3, label: "Sweden" }
		]
	}]
});
tuition.render();
}')

  html.write('</script>')
end

def display_employees(html, scraper)
  employees_table = scraper.get_employees
  html.write('<div class="slider-item">')
  html.write('<h2>Employees</h2>')
  html.write('</div>')
  html.write('<table class ="table" id="employees_table"')
  html.write(employees_table)
  html.write('</table>')

  #use canvas tag to display graph need to add canvas id
  html.write('<div class="chart"><canvas id=""></canvas></div>')
  
  #Use javascript to create a graph of the table
  html.write('<script>')
  
  #javascript code goes here we could create a seperate function for 
  #this and call it here
  html.write('</script>')
end

def display_research(html, scraper)
  research_table = scraper.get_research
  html.write('<div class="slider-item">')
  html.write('<h2>Research</h2>')
  html.write('</div>')
  html.write('<table class ="table" id="research_table"')
  html.write(research_table)
  html.write('</table>')

  #use canvas tag to display graph need to add canvas id
  html.write('<div class="chart"><canvas id=""></canvas></div>')
  
  #Use javascript to create a graph of the table
  html.write('<script>')
  
  #javascript code goes here we could create a seperate function for 
  #this and call it here
  html.write('</script>')
end

def display_endowment(html, scraper)
  endowment_table = scraper.get_endowment
  html.write('<div class="slider-item">')
  html.write('<h2>Endowment</h2>')
  html.write('</div>')
  html.write('<table class ="table" id="endowment_table"')
  html.write(endowment_table)
  html.write('</table>')

  #use canvas tag to display graph need to add canvas id
  html.write('<div class="chart"><canvas id=""></canvas></div>')
  
  #Use javascript to create a graph of the table
  html.write('<script>')
  
  #javascript code goes here we could create a seperate function for 
  #this and call it here
  html.write('</script>')
end

def display_budget(html, scraper)
  budget_table = scraper.get_budget
  html.write('<div class="slider-item">')
  html.write('<h2>Budget</h2>')
  html.write('</div>')
  html.write('<table class ="table" id="budget_table"')
  html.write(budget_table)
  html.write('</table>')

  #use canvas tag to display graph need to add canvas id
  html.write('<div class="chart"><canvas id="budget"></canvas></div>')
  
  #Use javascript to create a graph of the table
  html.write('<script>')

  html.write('window.onload = function () {
    var budget = new CanvasJS.Chart("chartContainer", {
    title:{
      text: "Budget"
    },	
    axisY: {
      title: "Billions of Dollars",
      titleFontColor: "#4F81BC",
      lineColor: "#4F81BC",
      labelFontColor: "#4F81BC",
      tickColor: "#4F81BC"
    },
    legend: {
      cursor:"pointer",
      itemclick: toggleDataSeries
    },
    data: [{
      type: "column",
      name: "Total Revenues",
      legendText: "Total Revenues (bil)",
      showInLegend: true, 
      dataPoints:[
        { label: "Saudi", y: 266.21 },
        { label: "Venezuela", y: 302.25 }
      ]
    },
    {
      type: "column",	
      name: "Total Expenditures",
      legendText: "Total Expenditures (bil)",
      showInLegend: true,
      dataPoints:[
        { label: "Saudi", y: 10.46 },
        { label: "Venezuela", y: 2.27 }
      ]
    }]
  });
  budget.render();
}')
  html.write('</script>')
end

def display_fundRaising(html, scraper)
  fundRaising_table = scraper.get_fundRaising
  html.write('<div class="slider-item">')
  html.write('<h2>Fund Raising</h2>')
  html.write('</div>')
  html.write('<table class ="table" id="fundRaising_table"')
  html.write(fundRaising_table)
  html.write('</table>')

  #use canvas tag to display graph need to add canvas id
  html.write('<div class="chart"><canvas id=""></canvas></div>')
  
  #Use javascript to create a graph of the table
  html.write('<script>')
  
  #javascript code goes here we could create a seperate function for 
  #this and call it here
  html.write('</script>')
end

def display_payroll(html, scraper)
  payroll_table = scraper.get_payroll
  html.write('<div class="slider-item">')
  html.write('<h2>Payroll</h2>')
  html.write('</div>')
  html.write('<table class ="table" id="payroll_table"')
  html.write(payroll_table)
  html.write('</table>')

  #use canvas tag to display graph need to add canvas id
  html.write('<div class="chart"><canvas id=""></canvas></div>')
  
  #Use javascript to create a graph of the table
  html.write('<script>')
  
  #javascript code goes here we could create a seperate function for 
  #this and call it here
  html.write('</script>')
end

def display_acreage(html, scraper)
  acreage_table = scraper.get_acreage
  html.write('<div class="slider-item">')
  html.write('<h2>Acreage</h2>')
  html.write('</div>')
  html.write('<table class ="table" id="acreage_table"')
  html.write(acreage_table)
  html.write('</table>')

  #use canvas tag to display graph need to add canvas id
  html.write('<div class="chart"><canvas id=""></canvas></div>')
  
  #Use javascript to create a graph of the table
  html.write('<script>')
  
  #javascript code goes here we could create a seperate function for 
  #this and call it here
  html.write('</script>')
end

def display_buildings(html, scraper)
  buildings_table = scraper.get_buildings
  html.write('<div class="slider-item">')
  html.write('<h2>Buildings</h2>')
  html.write('</div>')
  html.write('<table class ="table" id="buildings_table"')
  html.write(buildings_table)
  html.write('</table>')

  #use canvas tag to display graph need to add canvas id
  html.write('<div class="chart"><canvas id="buildings"></canvas></div>')
  
  #Use javascript to create a graph of the table
  html.write('<script>')

  html.write('window.onload = function () {
    var buildings = new CanvasJS.Chart("chartContainer", {
    title:{
      text: "Buildings",
      fontFamily: "arial black",
      fontColor: "#695A42"
    },
    axisY:{
      valueFormatString:"$#0bn",
      gridColor: "#B6B1A8",
      tickColor: "#B6B1A8"
    },
    toolTip: {
      shared: true,
      content: toolTipContent
    },
    data: [{
      type: "stackedColumn",
      showInLegend: true,
      color: "#696661",
      dataPoints: [
        { y: 6.75, x: new Date(2010,0) },
        { y: 8.57, x: new Date(2011,0) }
      ]
    }]
  });
  buildings.render();
}')

  html.write('</script>')
end

def display_administration(html, scraper)
  administration_table = scraper.get_administration
  html.write('<div class="slider-item">')
  html.write('<h2>Administration</h2>')
  html.write('</div>')
  html.write('<table class ="table" id="administration_table"')
  html.write(administration_table)
  html.write('</table>')

  #use canvas tag to display graph need to add canvas id
  html.write('<div class="chart"><canvas id=""></canvas></div>')
  
  #Use javascript to create a graph of the table
  html.write('<script>')
  
  #javascript code goes here we could create a seperate function for 
  #this and call it here
  html.write('</script>')
end

def end_tags(html)
  html.write('</body>')
  html.write('</html>')
end

def display_trustees(html, scraper)
  trustees_table = scraper.get_trustees
  html.write('<div class="slider-item">')
  html.write('<h2>Trustees</h2>')
  html.write('</div>')
  html.write('<table class ="table" id="trustees_table"')
  html.write(trustees_table)
  html.write('</table>')

  #use canvas tag to display graph need to add canvas id
  html.write('<div class="chart"><canvas id=""></canvas></div>')
  
  #Use javascript to create a graph of the table
  html.write('<script>')
  
  #javascript code goes here we could create a seperate function for 
  #this and call it here
  html.write('</script>')
end

def display_historicalInformation(html, scraper)
  historicalInformation_table = scraper.get_historicalInformation
  html.write('<div class="slider-item">')
  html.write('<h2>Historical Information</h2>')
  html.write('</div>')
  html.write('<table class ="table" id="historicalInformation_table"')
  html.write(historicalInformation_table)
  html.write('</table>')

  #use canvas tag to display graph need to add canvas id
  html.write('<div class="chart"><canvas id=""></canvas></div>')
  
  #Use javascript to create a graph of the table
  html.write('<script>')
  
  #javascript code goes here we could create a seperate function for 
  #this and call it here
  html.write('</script>')
end

def end_tags(html)
  html.write('</body>')
  html.write('</html>')
end

scraper = Scrape.new

html = File.new('Stats.html', 'w')

starting_tags(html)
display_enrollment(html, scraper)
display_academicStructure(html, scraper)
display_tuitionAndFees(html, scraper)
display_employees(html, scraper)
display_research(html, scraper)
display_endowment(html, scraper)
display_budget(html, scraper)
display_fundRaising(html, scraper)
display_payroll(html, scraper)
display_acreage(html, scraper)
display_buildings(html, scraper)
display_administration(html, scraper)
display_trustees(html, scraper)
display_historicalInformation(html, scraper)
end_tags(html)