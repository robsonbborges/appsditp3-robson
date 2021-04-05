package br.edu.apptp3robsonborges.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import br.edu.apptp3robsonborges.model.negocio.Usuario;
import br.edu.apptp3robsonborges.model.service.UsuarioService;

@Controller
public class UsuarioController {
	
	@Autowired
	public UsuarioService usuarioService;
	
	@GetMapping(value = "/")
	public String apresentar(Model model) {
		String nome = "Robson Baptista";
		String email = "robson.borges@al.infnet.edu.br";
		String git = "";
		return "index";
		
		model.addAllAttributes("nome", "Robson Baptista");
		model.addAllAttributes("email", "robson.borges@al.infnet.edu.br");
		model.addAllAttributes("git", "");
	}

	@GetMapping(value="/usuario")
	public String cadastrar(Model model) {
		
		model.addAttribute("usuarios", usuarioService.obterLista()) ;
		
		return "usuario/detalhe";
	}
	
	@PostMapping(value = "/usuario/incluir")
	public String incluir(Usuario usuario) {
		
		usuarioService.incluir(usuario);
		
		return "redirect:/usuario";
	}

	@GetMapping(value = "/usuario/{id}/excluir")
	
	public String excluir(@PathVariable Integer id) {
		
		usuarioService.excluir(id);
		
		return "redirect:/usuario";
	}
	
}
