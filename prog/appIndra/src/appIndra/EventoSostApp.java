package appIndra;

import java.util.Scanner;

public class EventoSostApp {
    static String[] nombres = new String[5];
    static String[] fechas = new String[5];
    static String[] descripciones = new String[5];
  //crear los eventos
    public static void inicializarEventos() {
        nombres[0] = "Conferencia Energía Renovable";
        fechas[0] = "25/03/2025";
        descripciones[0] = "Evento sobre energías limpias.";
        
        nombres[1] = "Taller de Reciclaje";
        fechas[1] = "05/04/2025";
        descripciones[1] = "Aprende a reciclar de forma creativa.";
        
        nombres[2] = "Feria de Productos Ecológicos";
        fechas[2] = "12/04/2025";
        descripciones[2] = "Exposición de productos sostenibles.";
        
        nombres[3] = "Jornada de Reforestación";
        fechas[3] = "20/04/2025";
        descripciones[3] = "Actividad para plantar árboles.";
        
        nombres[4] = "Seminario sobre Cambio Climático";
        fechas[4] = "30/04/2025";
        descripciones[4] = "Expertos hablarán sobre el impacto ambiental.";
    }

    //mostrar eventos creados en el metodo anterior
    public static void mostrarEventos() {
        System.out.println("\nLista de eventos:");
        for (int i = 0; i < nombres.length; i++) {
            System.out.println((i + 1) + ". " + nombres[i] + " - " + fechas[i]);
        }
    }

    //mostrar detalles de un evento especificado
    public static void mostrarDetallesEvento(Scanner scanner) {
        System.out.print("\nIntroduce el número del evento para ver los detalles: ");
        int numeroEvento = scanner.nextInt();

        if (numeroEvento >= 1 && numeroEvento <= nombres.length) {
            System.out.println("\nDetalles del evento:");
            System.out.println("Nombre: " + nombres[numeroEvento - 1]);
            System.out.println("Fecha: " + fechas[numeroEvento - 1]);
            System.out.println("Descripción: " + descripciones[numeroEvento - 1]);
        } else {
            System.out.println("Número de evento no válido.");
        }
    }
    public static void main(String[] args) {
    	
        inicializarEventos();
        //menu
        Scanner scanner = new Scanner(System.in);
        int opcion;
        do {
            System.out.println("\nBienvenido a la gestión de eventos:");
            System.out.println("1. Ver lista de eventos");
            System.out.println("2. Ver detalles de un evento");
            System.out.println("3. Salir");
            System.out.print("Selecciona una opción: ");
            opcion = scanner.nextInt();
            switch (opcion) {
                case 1:
                    mostrarEventos();
                    break;
                case 2:
                    mostrarDetallesEvento(scanner);
                    break;
                case 3:
                    System.out.println("Gracias por usar la aplicación.");
                    break;
                default:
                    System.out.println("Opción no válida. Por favor, selecciona otra opción.");
            }
        } while (opcion != 3);
        scanner.close();
    }

    
}
