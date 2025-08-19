FROM public.ecr.aws/docker/library/node:18 AS builder

WORKDIR /usr/src/app

# Install dependencies
COPY package*.json ./
COPY tsconfig*.json ./
RUN npm install --quiet

# Copy source code and build
COPY . .
RUN npm run build


# ---- Runtime Stage ----
FROM public.ecr.aws/docker/library/node:18-slim

WORKDIR /usr/src/app

# Only copy built code + node_modules
COPY --from=builder /usr/src/app/node_modules ./node_modules
COPY --from=builder /usr/src/app/dist ./dist
COPY package*.json ./

CMD ["npm", "run", "start:dev"]
