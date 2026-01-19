# Conference Badge Clone (Rails Project)

## Project Overview

This is a Ruby on Rails application inspired by [ConferenceBadge](https://www.conferencebadge.com/).  
It allows event organizers to:

- Create and manage **events**
- Add and manage **attendees**
- Generate **QR codes** for attendees
- Generate **printable PDF badges** with attendee details and QR code
- Securely manage access through **authentication** (Devise)
- Delete events and attendees safely with ownership enforcement

This project demonstrates **real-world Rails architecture** with nested resources, service objects, and RESTful conventions.

---

## Features

### Events

- Create, view, and delete events
- Only event owners can manage their events
- Events have `name`, `date`, and `location` fields
- Full RESTful CRUD structure

### Attendees

- Add, view, and delete attendees for each event
- Attendees have `full_name`, `company`, `role`, and `email`
- Nested resource under events
- Delete actions include confirmation dialogs

### QR Code Generation

- Each attendee has a **unique token**
- Token is used to generate a QR code
- QR codes link to a **check-in page** for the attendee
- Tokenized URLs ensure security and prevent guessing

### PDF Badge Generation

- Generates **printable A7 badge PDFs** for attendees
- Badge includes: name, company, role, and QR code
- Implemented with **Prawn** in a dedicated service object
- Service object separates business logic from controllers

### Authentication & Authorization

- **Devise** handles user authentication
- Event ownership is enforced:
  - Only the creator can manage attendees and delete events
- Prevents unauthorized access

### UX / UI

- Tailwind CSS for clean, responsive layout
- Confirmation dialogs for destructive actions
- Grid-based attendee display with QR codes and badge links
- Minimal, readable, modern design

---

## Architecture & Code Structure

- **Nested resources** enforce ownership and scope
- **Service objects** keep controllers clean
- RESTful conventions followed throughout

---

## Setup Instructions (Local Development)

### Prerequisites

- Ruby >= 3.x
- Rails >= 7.x
- PostgreSQL (or SQLite for development)
- Node.js + Yarn (for JS and Tailwind)

### Clone and Setup

```bash
git clone <repo-url>
cd <repo-folder>
bundle install
yarn install # if using Tailwind / JS
rails db:create
rails db:migrate
```

### Run the Server

```bash
bin/dev # or rails server
```

### Usage Instructions

# Events

- Sign up or log in
- Navigate to Events
- Click New Event → fill in details
- Delete events safely with confirmation

# Attendees

- Select an event
- Click Add Attendee
- Fill in attendee info
- Delete attendees safely
- QR codes displayed next to each attendee
- Download badge PDF with the Badge PDF link

# QR Code Check-in

- Scan attendee QR code
- Opens check-in page with attendee info

# PDF Badge

- Generated via service object
- Opens inline in browser
- Ready to print

## Notes & Best Practices

- All destructive actions (delete) are confirmed
- All controller actions enforce ownership via parent associations
- QR codes are tokenized for security
- Service objects handle PDF generation for separation of concerns

## Gems / Libraries Used

- Devise - authentication
- Prawn - PDF generation
- rqrcode - QR code generation
- Tailwind CSS - responsive UI
- Turbo / Hotwire - optional interactivity
