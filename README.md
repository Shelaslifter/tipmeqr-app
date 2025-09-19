# tipmeqr-app (Frontend)

![TipMeQR App Showcase]  Una plataforma de donaciones descentralizada construida con Flutter y Open Payments, diseñada para que organizaciones y ONGs puedan lanzar campañas de recaudación de fondos de manera rápida, transparente y segura.

---

## 🚀 Misión del Proyecto

En situaciones de emergencia o para causas sociales, las donaciones tradicionales a menudo enfrentan dos grandes problemas: altas comisiones de intermediarios y lentitud en la llegada de los fondos.

**tipmeqr-app** ataca este problema de raíz utilizando el estándar de **Open Payments**. Creamos una aplicación móvil donde cualquier organización puede generar una campaña de donación con un código QR único y de tiempo limitado. Los donantes escanean el código y el dinero se transfiere de manera instantánea y directa a la billetera de la organización, sin intermediarios.

**El dinero correcto, a la cuenta correcta, en el momento correcto.**

---

## ✨ Características Principales

* **Flujo de Usuario Separado:** Experiencias de usuario distintas para **Organizaciones (Recibidores)** y **Donantes**.
* **Creación de Campañas Dinámicas:** Las organizaciones pueden crear campañas con nombres y duraciones personalizadas.
* **Generación de QR Instantánea:** La app se conecta a un backend para generar códigos QR de pago válidos en la red de pruebas de Open Payments.
* **Escáner de QR Integrado:** Los donantes pueden usar la cámara de su teléfono para escanear y donar a una causa.
* **Seguridad y Transparencia:** Construido sobre el estándar de Open Payments para garantizar que los fondos vayan directamente a la organización sin intermediarios.

---

## 🛠️ Tecnologías Utilizadas

* **Framework:** Flutter 3.x
* **Lenguaje:** Dart
* **Paquetes Clave:**
    * `http`: Para la comunicación con la API del backend.
    * `qr_flutter`: Para generar los widgets de los códigos QR.
    * `mobile_scanner`: Para la funcionalidad de escaneo de QR.
    * `shared_preferences`: Para gestionar el estado de la sesión del usuario.
* **Plataforma de Pagos:** Open Payments (utilizando la Interledger Test Wallet)

---

## 🏁 Cómo Empezar

1.  **Clona el repositorio:**
    ```bash
    git clone https://github.com/Shelaslifter/tipmeqr-app.git
    ```
2.  **Navega a la carpeta del proyecto:**
    ```bash
    cd front
    ```
3.  **Instala las dependencias:**
    ```bash
    flutter pub get
    ```
4.  **Ejecuta la aplicación:**
    ```bash
    flutter run
    ```

---

