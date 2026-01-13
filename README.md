# Wellbeing

Minimal iOS research application built in **Objective-C** to study and understand the internal architecture of **Apple’s ResearchKit framework**.

This project exists as a technical exploration and reference implementation, not as a production consumer app.

---

## Purpose

The primary goal of this project is to:

- Gain a deep, practical understanding of ResearchKit’s core abstractions.
- Validate correct usage patterns before contributing to the ResearchKit open-source repository.
- Work directly with the framework in its native language: Objective-C.

The app implements a simple wellbeing study using consent and daily surveys, covering the majority of ResearchKit’s fundamental APIs.

---

## Scope

Implemented features:

- Consent flow using `ORKConsentDocument`, `ORKVisualConsentStep`, and `ORKConsentReviewStep`
- Daily survey using `ORKQuestionStep` and `ORKOrderedTask`
- Task orchestration via `ORKTaskViewController`
- Clear separation between task construction, UI flow, and data modeling

Intentionally excluded:

- Swift
- SwiftUI
- HealthKit
- Apple Watch integration
- Backend synchronization

---

## Core Concepts Demonstrated

- ResearchKit lifecycle: `ORKTask → ORKStep → ORKResult`
- Consent handling and signature management
- Survey composition and answer formats
- Delegate-driven task completion flow
- Result extraction and domain mapping

---

## Why Objective-C

ResearchKit is authored and maintained in Objective-C.

Working in Objective-C enables:

- Direct alignment with the framework’s internal design.
- Accurate mental models of ownership, nullability, and delegation.
- Meaningful contributions (PRs, fixes, refactors) to the upstream project.

Swift wrappers are intentionally avoided.

---

## Requirements

- iOS 16+
- Xcode 15+
- UIKit
- ResearchKit (via Swift Package Manager or submodule)

---

## Status

This project is intentionally minimal and iterative.  
Each feature is added only to illuminate a specific aspect of ResearchKit’s design.

The repository serves as:
- A learning artifact
- A contribution preparation ground
- A technical reference for ResearchKit usage in Objective-C

---
