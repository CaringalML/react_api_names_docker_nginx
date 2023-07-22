import React, { useEffect, useState } from 'react';
import axios from 'axios';

const MyComponent = () => {
  const [names, setNames] = useState([]);

  useEffect(() => {
    const fetchNames = async () => {
      try {
        const response = await axios.get(`${process.env.REACT_APP_LARAVEL_API}/api/names`);
        setNames(response.data);
      } catch (error) {
        console.error('Error fetching names:', error);
      }
    };

    fetchNames();
  }, []);

  return (
    <div>
      <h1>Names</h1>
      <ul>
        {names.map((name) => (
          <li key={name.id}>{name.people}</li>
        ))}
      </ul>
    </div>
  );
};

export default MyComponent;
