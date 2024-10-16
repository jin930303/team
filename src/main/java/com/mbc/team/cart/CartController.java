package com.mbc.team.cart;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CartController {
    @Autowired
    CartService cartService;

    @RequestMapping(value = "/cart")
    public String cart(HttpServletRequest request, HttpSession hs) {
        try {
            String itemnumStr = request.getParameter("itemnum");
            String priceStr = request.getParameter("price");
            String countStr = request.getParameter("count");
            String product = request.getParameter("product");
            String op1 = request.getParameter("op1");
            String image1 = request.getParameter("image1");

            // 빈 문자열 체크 및 기본값 설정
            if (itemnumStr != null && !itemnumStr.isEmpty() &&
                priceStr != null && !priceStr.isEmpty() &&
                countStr != null && !countStr.isEmpty() &&
                product != null && !product.isEmpty() &&
                image1 != null && !image1.isEmpty()) {

                int itemnum = Integer.parseInt(itemnumStr);
                int price = Integer.parseInt(priceStr);
                int count = Integer.parseInt(countStr);

                // CartItem 객체 생성
                CartItem newItem = new CartItem(itemnum, product, price, op1, count, image1);

                // 세션에서 카트 가져오기
                List<CartItem> cart = (List<CartItem>) hs.getAttribute("cart");
                if (cart == null) {
                    cart = new ArrayList<>();
                }

                // 기존에 같은 아이템이 존재하는지 확인
                boolean itemExists = false;
                for (CartItem item : cart) {
                    if (item.getItemnum() == newItem.getItemnum() && item.getOp1().equals(newItem.getOp1())) {
                        // 아이템이 이미 존재하면 수량만 증가시킨다
                        item.setCount(item.getCount() + newItem.getCount());
                        itemExists = true;
                        break;
                    }
                }

                // 새로운 아이템이 없으면 추가
                if (!itemExists) {
                    cart.add(newItem);
                }

                // 세션에 카트 저장
                hs.setAttribute("cart", cart);
                System.out.println("받은 op1 값: " + op1);
            }

            return "cart"; // cart 페이지로 이동

        } catch (NumberFormatException e) {
            // 예외 처리 로직 추가
            System.err.println("잘못된 입력 값: " + e.getMessage());
            request.setAttribute("errorMessage", "입력 값이 잘못되었습니다. 다시 시도해 주세요.");
            return "error"; // 에러 페이지로 리다이렉트
        } catch (Exception e) {
            // 기타 예외 처리
            System.err.println("처리 중 오류 발생: " + e.getMessage());
            request.setAttribute("errorMessage", "알 수 없는 오류가 발생했습니다. 다시 시도해 주세요.");
            return "error"; // 에러 페이지로 리다이렉트
        }
    }

    @RequestMapping("/deleteCartItem")
    public String deleteCartItem(@RequestParam("itemnum") int itemnum, HttpSession session) {
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart != null) {
            cart.removeIf(item -> item.getItemnum() == itemnum);
            session.setAttribute("cart", cart);
        }
        return "redirect:/cart"; // 장바구니 페이지로 리다이렉트
    }

    @RequestMapping("/clearCart")
    public String clearCart(HttpSession session) {
        session.removeAttribute("cart"); // 세션에서 장바구니 비우기
        return "redirect:/cart"; // 장바구니 페이지로 리다이렉트
    }

 // 로그인 상태 체크 및 구매 처리
    @RequestMapping(value = "/buySelectedItems", method = RequestMethod.POST)
    public String buySelectedItems(@RequestParam(value = "selectedItems", required = false) List<String> selectedItems,
                                    HttpSession session, HttpServletRequest request) {
        // 로그인 상태가 false인 경우 로그인 페이지로 리디렉션
        Boolean loginState = (Boolean) session.getAttribute("loginstate");
        if (loginState == null || !loginState) {
            return "redirect:/login"; // 로그인되지 않았으면 로그인 페이지로 리디렉션
        }

        // 선택된 아이템이 있을 경우에만 처리
        if (selectedItems != null && !selectedItems.isEmpty()) {
            List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
            if (cart != null) {
                List<CartItem> itemsToBuy = new ArrayList<>();
                // 선택된 아이템만 필터링하여 itemsToBuy 리스트에 추가
                for (CartItem item : cart) {
                    if (selectedItems.contains(String.valueOf(item.getItemnum()))) {
                        itemsToBuy.add(item);
                    }
                }
                // 아이템을 구매 처리하는 로직을 추가 (예: DB에 저장, 결제 등)
                session.setAttribute("itemsToBuy", itemsToBuy);  // 세션에 선택된 아이템 저장
            }
        } else {
            // 선택된 상품이 없으면 장바구니 페이지로 리다이렉트
            request.setAttribute("errorMessage", "상품을 선택하세요.");
            return "cart";  // 장바구니 페이지로 리다이렉트
        }
        return "buyproduct";  // 구매 페이지로 이동
    }

    // 구매 처리 로직 (로그인 상태 확인 후 진행)
    @RequestMapping(value = "/confirmPurchase", method = RequestMethod.POST)
    public String confirmPurchase(HttpSession session) {
        // 로그인 상태가 false인 경우 로그인 페이지로 리디렉션
        Boolean loginState = (Boolean) session.getAttribute("loginstate");
        if (loginState == null || !loginState) {
            return "redirect:/login"; // 로그인되지 않았으면 로그인 페이지로 리디렉션
        }

        // 장바구니에서 선택한 상품 가져오기
        List<CartItem> itemsToBuy = (List<CartItem>) session.getAttribute("itemsToBuy");

        if (itemsToBuy != null && !itemsToBuy.isEmpty()) {
            // 여기에 DB에 저장하는 로직 (예: 주문 정보 저장)
            // 예시로 DB에 저장한다고 가정
            for (CartItem item : itemsToBuy) {
                // DB에 저장하는 로직 추가 (예: 주문 테이블에 저장)
                System.out.println("구매한 상품: " + item.getProduct() + " 수량: " + item.getCount());
            }

            // 구매 완료 후 장바구니에서 해당 상품 제거
            List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
            if (cart != null) {
                // 구매한 상품들만 제거
                cart.removeIf(item -> itemsToBuy.contains(item));
                session.setAttribute("cart", cart);  // 수정된 장바구니 다시 세션에 저장
            }

            // 구매 완료 페이지로 리디렉션
            return "purchaseComplete";  // 구매 완료 페이지로 이동
        } else {
            // 상품이 없으면 장바구니로 돌아가기
            return "redirect:/cart";  // 장바구니로 리디렉션 수정
        }
    }
}