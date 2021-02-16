import React, { useState } from "react";

import Vendors from "./components/Vendors";

import "react-toastify/dist/ReactToastify.css";
import "bootstrap/dist/css/bootstrap.min.css";
import "./App.css";

import Container from "react-bootstrap/Container";
import Row from "react-bootstrap/Row";
import Button from "react-bootstrap/Button";
import { ToastContainer } from "react-toastify";

function App() {
  const TRUCKS = "truck";
  const FOOD_CARTS = "carts";
  const ALL_VENDORS = "food";

  const [vendorType, setVendorType] = useState(ALL_VENDORS);
  return (
    <Container>
      <ToastContainer autoClose={3000} hideProgressBar />
      <Row className="top-row justify-content-md-center">
        <h1>Food Vendors</h1>
        <Container>
          <Button
            variant="primary"
            className="food_type"
            size="lg"
            onClick={() => {
              setVendorType(ALL_VENDORS);
            }}
          >
            All Vendors
          </Button>
          <Button
            variant="primary"
            className="food_type"
            size="lg"
            onClick={() => {
              setVendorType(TRUCKS);
            }}
          >
            Trucks
          </Button>
          <Button
            variant="primary"
            className="food_type"
            size="lg"
            onClick={() => {
              setVendorType(FOOD_CARTS);
            }}
          >
            Food Carts
          </Button>
        </Container>
        <Container className="inner_body">
          <Vendors vendorType={vendorType} />
        </Container>
      </Row>
    </Container>
  );
}

export default App;
