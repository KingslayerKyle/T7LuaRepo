require( "ui.uieditor.widgets.CAC.AllocationBar" )

CoD.AllocationSpentWidget = InheritFrom( LUI.UIElement )
CoD.AllocationSpentWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AllocationSpentWidget )
	self.id = "AllocationSpentWidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 402 )
	self:setTopBottom( 0, 0, 0, 12 )
	self.anyChildUsesUpdateState = true
	
	local AllocationBar0 = CoD.AllocationBar.new( menu, controller )
	AllocationBar0:setLeftRight( 0, 0, 0, 24 )
	AllocationBar0:setTopBottom( 0, 0, 0, 48 )
	self:addElement( AllocationBar0 )
	self.AllocationBar0 = AllocationBar0
	
	local AllocationBar1 = CoD.AllocationBar.new( menu, controller )
	AllocationBar1:setLeftRight( 0, 0, 28, 52 )
	AllocationBar1:setTopBottom( 0, 0, 0, 48 )
	self:addElement( AllocationBar1 )
	self.AllocationBar1 = AllocationBar1
	
	local AllocationBar2 = CoD.AllocationBar.new( menu, controller )
	AllocationBar2:setLeftRight( 0, 0, 57, 81 )
	AllocationBar2:setTopBottom( 0, 0, 0, 48 )
	self:addElement( AllocationBar2 )
	self.AllocationBar2 = AllocationBar2
	
	local AllocationBar3 = CoD.AllocationBar.new( menu, controller )
	AllocationBar3:setLeftRight( 0, 0, 86, 110 )
	AllocationBar3:setTopBottom( 0, 0, 0, 48 )
	self:addElement( AllocationBar3 )
	self.AllocationBar3 = AllocationBar3
	
	local AllocationBar4 = CoD.AllocationBar.new( menu, controller )
	AllocationBar4:setLeftRight( 0, 0, 114, 138 )
	AllocationBar4:setTopBottom( 0, 0, 0, 48 )
	self:addElement( AllocationBar4 )
	self.AllocationBar4 = AllocationBar4
	
	local AllocationBar5 = CoD.AllocationBar.new( menu, controller )
	AllocationBar5:setLeftRight( 0, 0, 142, 166 )
	AllocationBar5:setTopBottom( 0, 0, 0, 48 )
	self:addElement( AllocationBar5 )
	self.AllocationBar5 = AllocationBar5
	
	local AllocationBar6 = CoD.AllocationBar.new( menu, controller )
	AllocationBar6:setLeftRight( 0, 0, 171, 195 )
	AllocationBar6:setTopBottom( 0, 0, 0, 48 )
	self:addElement( AllocationBar6 )
	self.AllocationBar6 = AllocationBar6
	
	local AllocationBar7 = CoD.AllocationBar.new( menu, controller )
	AllocationBar7:setLeftRight( 0, 0, 200, 224 )
	AllocationBar7:setTopBottom( 0, 0, 0, 48 )
	self:addElement( AllocationBar7 )
	self.AllocationBar7 = AllocationBar7
	
	local AllocationBar8 = CoD.AllocationBar.new( menu, controller )
	AllocationBar8:setLeftRight( 0, 0, 228, 252 )
	AllocationBar8:setTopBottom( 0, 0, 0, 48 )
	self:addElement( AllocationBar8 )
	self.AllocationBar8 = AllocationBar8
	
	local AllocationBar9 = CoD.AllocationBar.new( menu, controller )
	AllocationBar9:setLeftRight( 0, 0, 256, 280 )
	AllocationBar9:setTopBottom( 0, 0, 0, 48 )
	self:addElement( AllocationBar9 )
	self.AllocationBar9 = AllocationBar9
	
	local AllocationBar10 = CoD.AllocationBar.new( menu, controller )
	AllocationBar10:setLeftRight( 0, 0, 285, 309 )
	AllocationBar10:setTopBottom( 0, 0, 0, 48 )
	self:addElement( AllocationBar10 )
	self.AllocationBar10 = AllocationBar10
	
	local AllocationBar11 = CoD.AllocationBar.new( menu, controller )
	AllocationBar11:setLeftRight( 0, 0, 314, 338 )
	AllocationBar11:setTopBottom( 0, 0, 0, 48 )
	self:addElement( AllocationBar11 )
	self.AllocationBar11 = AllocationBar11
	
	local AllocationBar12 = CoD.AllocationBar.new( menu, controller )
	AllocationBar12:setLeftRight( 0, 0, 342, 366 )
	AllocationBar12:setTopBottom( 0, 0, 0, 48 )
	self:addElement( AllocationBar12 )
	self.AllocationBar12 = AllocationBar12
	
	local AllocationBar13 = CoD.AllocationBar.new( menu, controller )
	AllocationBar13:setLeftRight( 0, 0, 370, 394 )
	AllocationBar13:setTopBottom( 0, 0, 0, 48 )
	self:addElement( AllocationBar13 )
	self.AllocationBar13 = AllocationBar13
	
	local AllocationBar14 = CoD.AllocationBar.new( menu, controller )
	AllocationBar14:setLeftRight( 0, 0, 399, 423 )
	AllocationBar14:setTopBottom( 0, 0, 0, 48 )
	self:addElement( AllocationBar14 )
	self.AllocationBar14 = AllocationBar14
	
	local AllocationBar15 = CoD.AllocationBar.new( menu, controller )
	AllocationBar15:setLeftRight( 0, 0, 428, 452 )
	AllocationBar15:setTopBottom( 0, 0, 0, 48 )
	self:addElement( AllocationBar15 )
	self.AllocationBar15 = AllocationBar15
	
	local AllocationBar16 = CoD.AllocationBar.new( menu, controller )
	AllocationBar16:setLeftRight( 0, 0, 456, 480 )
	AllocationBar16:setTopBottom( 0, 0, 0, 48 )
	self:addElement( AllocationBar16 )
	self.AllocationBar16 = AllocationBar16
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.AllocationBar0:close()
		self.AllocationBar1:close()
		self.AllocationBar2:close()
		self.AllocationBar3:close()
		self.AllocationBar4:close()
		self.AllocationBar5:close()
		self.AllocationBar6:close()
		self.AllocationBar7:close()
		self.AllocationBar8:close()
		self.AllocationBar9:close()
		self.AllocationBar10:close()
		self.AllocationBar11:close()
		self.AllocationBar12:close()
		self.AllocationBar13:close()
		self.AllocationBar14:close()
		self.AllocationBar15:close()
		self.AllocationBar16:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

