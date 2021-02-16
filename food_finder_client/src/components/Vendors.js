import React, { useState, useEffect } from "react";

import Table from "react-bootstrap/Table";
import { toast } from "react-toastify";
import axios from "axios";
import { Cart, Truck } from "react-bootstrap-icons";

function VendorType({ type }) {
  if (type === "Push Cart") {
    return <Cart />;
  } else if (type === "Truck") {
    return <Truck />;
  } else {
    return "";
  }
}

function VendorRow({ vendor }) {
  if (vendor) {
    return (
      <tr>
        <td>
          <VendorType type={vendor.facility_type} />
        </td>
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

function Vendors({ vendorType }) {
  const [vendors, setVendors] = useState([]);

  useEffect(() => {
    console.log("Getting customer list");
    const fetchData = async () => {
      try {
        const response = await axios.get(
          "http://localhost:3000/api/v1/" + vendorType
        );
        console.log("[DBG] response.data: ", response.data);
        setVendors(response.data.results);
      } catch (error) {
        console.log("[DBG] error: ", error);
        toast.error("Could not retrieve Food Vendors");
        setVendors([]);
      }
    };
    fetchData();
  }, [vendorType]);

  return (
    <Table hover className="overflow-auto">
      <thead>
        <tr>
          <th>Name</th>
          <th>Location</th>
          <th>Address</th>
          <th>Description</th>
        </tr>
      </thead>
      <tbody>
        {vendors.map((vendor, key) => {
          return <VendorRow vendor={vendor} key={key} />;
        })}
      </tbody>
    </Table>
  );
}

export default Vendors;
