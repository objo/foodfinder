import React, { useState, useEffect } from "react";

import Table from "react-bootstrap/Table";

function VendorRow({ vendor }) {
  if (vendor) {
    return (
      <tr>
        <td>{vendor.first}</td>
        <td>{vendor.last}</td>
        <td>{vendor.username}</td>
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
    setVendors([
      {
        first: "Mark",
        last: "Otto",
        username: "@mdo",
      },
      {
        first: "Jacob",
        last: "Thornton",
        username: "@fat",
      },
      {
        first: "Joe",
        last: "O'Brien",
        username: "@objo",
      },
    ]);
  }, [setVendors]);

  return (
    <Table hover>
      <thead>
        <tr>
          <th>#</th>
          <th>First Name</th>
          <th>Last Name</th>
          <th>Username</th>
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
