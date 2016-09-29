package hash;

import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.SortedMap;
import java.util.TreeMap;

public class Hash {

	
	public static TreeMap<Long, Node> nodes = new TreeMap<Long, Node>();
	public static List<Node> reNode = new ArrayList<Node>();
	//虚拟node数
	public static int VRITUAL_NUM = 13;
	
	public  void init() {
		
		
		for (int i = 0; i < 3; i++) {
			
			Node node = new Node();
			node.setId(i);
			node.setAddress("192.168.1.100:" +i);
			reNode.add(node);
		}
		
		
		for (int i = 0; i < reNode.size(); i++) {
			
			for (int j = 0; j < VRITUAL_NUM; j++) {
				
				nodes.put(hash(md5(String.valueOf(reNode.get(i).getId() +"-"+j)),j), reNode.get(i));
			} 
		}
	}
	
	
	
	public  Node getNode(long hash) {
		
		Long key = hash;
		 SortedMap<Long, Node> tailMap = nodes.tailMap(key);
		 if (tailMap.isEmpty()) {
			key = nodes.firstKey();
		} else {
			key = tailMap.firstKey();
		}
		 return nodes.get(key);
		
		
	}
	/***
	 * hash函数的实现
	 * @author gaoyuandong
	 * @date 2015年10月28日 上午10:27:49
	 * @param by
	 * @return
	 */
	public   long hash(byte[] by,int times) {
		long va =(long) by[0 + times ] & 0XFF |
				(long) by[1 + times] & 0xFF<<8 | 
				(long)by[2 + times ] & 0xFF << 16 | 
				(long)by[3 + times] & 0xff <<24;
		
		return va & 0xFFFFFFFFL;
		
	}
	
	/***
	 * 获取md5
	 * 16个字节数组
	 * @author gaoyuandong
	 * @date 2015年10月28日 上午9:20:49
	 * @param key
	 * @return
	 */
	public  byte[] md5(String key){
		MessageDigest digest = null;
		byte[] by = null;
		try {
			digest = MessageDigest.getInstance("MD5");
			digest.reset();
			digest.update(key.getBytes("UTF-8"));
			by = digest.digest();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return by;
		
	}
	
	
	public long jsHash(byte[] by) {
		long va =(long) by[0 ] & 0XFF |(long) by[1 ] & 0xFF<<8 | (long)by[2 ] & 0xFF << 16 | (long)by[3] & 0xff <<24;
		return va & 0xFFFFFFFFL;
	}
	
	
	public void addNode(Node node) {
		
		for (int i = 0; i < VRITUAL_NUM; i++) {
			
			nodes.put(hash(md5(String.valueOf(node.getId() +"-"+i)), i), node);
		}
	}
	public static void main(String[] args) {
		Random random = new Random();
		
		Hash has = new Hash();
		has.init();
		System.err.println("一共有 " + nodes.size() +"个节点");
		for (int i = 0; i < 1; i++) {
			System.err.println("冬天--->" + has.getNode(has.jsHash(has.md5("冬天"))).getAddress());
			System.err.println("冬天1--->" + has.getNode(has.jsHash(has.md5("冬天1"))).getAddress());
			System.err.println("冬天2--->" + has.getNode(has.jsHash(has.md5("冬天2"))).getAddress());
			System.err.println("冬天3--->" + has.getNode(has.jsHash(has.md5("冬天3"))).getAddress());
			System.err.println("冬天4--->" + has.getNode(has.jsHash(has.md5("冬天4"))).getAddress());
			System.err.println("冬天5--->" + has.getNode(has.jsHash(has.md5("冬天5"))).getAddress());
			System.err.println("冬天6--->" + has.getNode(has.jsHash(has.md5("冬天6"))).getAddress());
			System.err.println("冬天7--->" + has.getNode(has.jsHash(has.md5("冬天7"))).getAddress());
			}
		
		Node node = new Node();
		node.setId(10200000);
		node.setAddress("新加入节点:192.168.1.100");
		has.addNode(node);
		System.err.println("============添加之后========");
		System.err.println("一共有 " + nodes.size() +"个节点");
		for (int i = 0; i < 1; i++) {
			has.init();
			System.err.println("冬天--->" + has.getNode(has.jsHash(has.md5("冬天"))).getAddress());
			System.err.println("冬天1--->" + has.getNode(has.jsHash(has.md5("冬天1"))).getAddress());
			System.err.println("冬天2--->" + has.getNode(has.jsHash(has.md5("冬天2"))).getAddress());
			System.err.println("冬天3--->" + has.getNode(has.jsHash(has.md5("冬天3"))).getAddress());
			System.err.println("冬天4--->" + has.getNode(has.jsHash(has.md5("冬天4"))).getAddress());
			System.err.println("冬天5--->" + has.getNode(has.jsHash(has.md5("冬天5"))).getAddress());
			System.err.println("冬天6--->" + has.getNode(has.jsHash(has.md5("冬天6"))).getAddress());
			System.err.println("冬天7--->" + has.getNode(has.jsHash(has.md5("冬天7"))).getAddress());
			}
		
		
		
	}
		
		
	}
	
	
	class Node {
		
		private int id;
		private String address;
		
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		@Override
		public String toString() {
			return "Node [id=" + id + ", address=" + address + "]";
		}
		
		
	}
	
