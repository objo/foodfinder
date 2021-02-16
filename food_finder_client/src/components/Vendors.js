import React, { useState, useEffect } from "react";

import Table from "react-bootstrap/Table";
import { toast } from "react-toastify";
import axios from "axios";

function VendorRow({ vendor }) {
  if (vendor) {
    return (
      <tr key={vendor.id}>
        <td>{vendor.name}</td>
        <td>{vendor.location_description}</td>
        <td>{vendor.address}</td>
        <td>{vendor.food_description}</td>
      </tr>
    );
  } else {
    return (
      <tr>
        <td></td>
        <td></td>
        <td></td>
      </tr>
    );
  }
}

function Vendors() {
  const [vendors, setVendors] = useState([]);

  useEffect(() => {
    console.log("Getting customer list");
    const fetchData = async () => {
      try {
        const response = await axios.get("http://localhost:3000/api/v1/food");
        console.log("[DBG] response.data: ", response.data);
        setVendors(response.data.results);
      } catch (error) {
        console.log("[DBG] error: ", error);
        toast.error("Could not retrieve Food Vendors");
        setVendors([]);
      }
    };
    fetchData();
  }, []);

  return (
    <Table hover>
      <thead>
        <tr>
          <th>Name</th>
          <th>Location</th>
          <th>Address</th>
          <th>Description</th>
        </tr>
      </thead>
      <tbody>
        {vendors.map((vendor) => {
          return <VendorRow vendor={vendor} />;
        })}
      </tbody>
    </Table>
  );
}

export default Vendors;
