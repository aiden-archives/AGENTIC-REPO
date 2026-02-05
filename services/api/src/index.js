import express from 'express';

const app = express();
const PORT = process.env.PORT || 8080;

app.use(express.json());

// Health check endpoint
app.get('/health', (req, res) => {
  res.json({ status: 'ok', timestamp: new Date().toISOString() });
});

// API routes placeholder
app.get('/api/v1/items', (req, res) => {
  res.json({ items: [], message: 'Replace this with your implementation' });
});

app.listen(PORT, () => {
  console.log(`API server running on port ${PORT}`);
});
