<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>

<%
    String name = "";
    int id = 0;

    try {
        id = Integer.parseInt(request.getParameter("id"));
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_blood", "root", "");

        PreparedStatement ps = con.prepareStatement("SELECT id,name FROM donor_information WHERE id = ?");
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();        

        if (rs.next()) {
        	id = rs.getInt("id");
            name = rs.getString("name");
            
        }

        con.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Certificate</title>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>

    <style>
        #certificate {
            height: 1000px;
            width: 1000px;
            text-align: center;
            background-image: url('./image/back-blood-donor.avif');
            background-repeat: no-repeat;
            background-size: cover;
            position: relative;
            margin: auto;
            padding: 40px;
        }

        h1 {
           margin-top:10px;
            font-size: 60px;
            color: red;
        }

        h2 {
            color: red;
            font-size: 50px;
            margin-top: 70px;
            margin-left: 250px;
        }

        .p {
           font-size: 20px;
           margin-left: 250px; 
        }

        .name {
           font-size: 65px;
           margin-left: 170px;
           line-height: 0.5;
        }

        .text {
            font-size: 20px;
            max-width: 500px;
            line-height: 1.6;
            margin-left: 280px;
        }

        .id {
            position: absolute;
            margin-left: 280px;
            font-size: 30px;
            padding-top:80px
        }
        span{
            color:red;
        }

        .buttons {
            text-align: center;
            margin-top: 20px;
        }

        button {
            padding: 10px 20px;
            font-size: 16px;
            margin: 0 10px;
            cursor: pointer;
        }
    </style>
</head>
<body>

    <div class="buttons">
        <button onclick="downloadPDF()">⬇️ Download PDF</button>
    </div>

   
    <div id="certificate">
        <h1><i>CERTIFICATE</i></h1>
        <h2><i>OF APPRECIATION</i></h2>
        <p class="p">PRESENTED TO</p>
        <p class="name"><i><%= name %></i></p>
        <p class="text">
            We extend our heartfelt appreciation for your invaluable service and unwavering commitment to the noble cause of blood donation.
        </p>
        <div class="id">
            <i>This Is Your Donor ID: <span><b> <%= id %></b></span></i>
        </div>
    </div>


    <script>
      function downloadPDF() {
        const element = document.getElementById("certificate");
        if (!element) {
          alert("Certificate content not found.");
          return;
        }

        const opt = {
          margin: 0,
          filename: 'donation-certificate.pdf',
          image: { type: 'jpeg', quality: 1 },
          html2canvas: { scale: 2, useCORS: true },
          jsPDF: { unit: 'px', format: [3000, 3000], orientation: 'portrait' }
        };

        html2pdf().set(opt).from(element).save();
      }

      function printCertificate() {
        window.print();
      }
    </script>

</body>
</html>
