package service;

import dao.ClientDAO;
import model.Client;
import util.EmailUtil;
import util.PasswordUtil;

import java.util.List;

/**
 * Service class for Client-related operations
 */
public class ClientService {

    private ClientDAO clientDAO = new ClientDAO();

    /**
     * Register a new client
     * @param client Client object to register
     * @return true if successful, false otherwise
     */
    public boolean registerClient(Client client) {
        // Generate salt and hash password
        String salt = PasswordUtil.generateSalt();
        String hashedPassword = PasswordUtil.hashPassword(client.getPassword(), salt);

        client.setPassword(hashedPassword);
        client.setPasswordSalt(salt);

        boolean registered = clientDAO.createClient(client);

        if (registered) {
            // Send welcome email
            EmailUtil.sendWelcomeEmail(client.getEmail(), client.getFullName());
        }

        return registered;
    }

    /**
     * Get a client by ID
     * @param clientId Client ID
     * @return Client object if found, null otherwise
     */
    public Client getClientById(int clientId) {
        return clientDAO.getClientById(clientId);
    }

    /**
     * Update a client's profile
     * @param client Client object to update
     * @return true if successful, false otherwise
     */
    public boolean updateClientProfile(Client client) {
        return clientDAO.updateClient(client);
    }

    /**
     * Get all clients
     * @return List of Client objects
     */
    public List<Client> getAllClients() {
        return clientDAO.getAllClients();
    }
}
