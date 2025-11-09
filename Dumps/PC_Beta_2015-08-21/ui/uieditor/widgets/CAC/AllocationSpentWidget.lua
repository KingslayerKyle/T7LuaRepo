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
	self:setLeftRight( true, false, 0, 268 )
	self:setTopBottom( true, false, 0, 8 )
	self.anyChildUsesUpdateState = true
	
	local AllocationBar0 = CoD.AllocationBar.new( menu, controller )
	AllocationBar0:setLeftRight( true, false, 0, 16 )
	AllocationBar0:setTopBottom( true, false, 0, 32 )
	self:addElement( AllocationBar0 )
	self.AllocationBar0 = AllocationBar0
	
	local AllocationBar1 = CoD.AllocationBar.new( menu, controller )
	AllocationBar1:setLeftRight( true, false, 19, 35 )
	AllocationBar1:setTopBottom( true, false, 0, 32 )
	self:addElement( AllocationBar1 )
	self.AllocationBar1 = AllocationBar1
	
	local AllocationBar2 = CoD.AllocationBar.new( menu, controller )
	AllocationBar2:setLeftRight( true, false, 38, 54 )
	AllocationBar2:setTopBottom( true, false, 0, 32 )
	self:addElement( AllocationBar2 )
	self.AllocationBar2 = AllocationBar2
	
	local AllocationBar3 = CoD.AllocationBar.new( menu, controller )
	AllocationBar3:setLeftRight( true, false, 57, 73 )
	AllocationBar3:setTopBottom( true, false, 0, 32 )
	self:addElement( AllocationBar3 )
	self.AllocationBar3 = AllocationBar3
	
	local AllocationBar4 = CoD.AllocationBar.new( menu, controller )
	AllocationBar4:setLeftRight( true, false, 76, 92 )
	AllocationBar4:setTopBottom( true, false, 0, 32 )
	self:addElement( AllocationBar4 )
	self.AllocationBar4 = AllocationBar4
	
	local AllocationBar5 = CoD.AllocationBar.new( menu, controller )
	AllocationBar5:setLeftRight( true, false, 95, 111 )
	AllocationBar5:setTopBottom( true, false, 0, 32 )
	self:addElement( AllocationBar5 )
	self.AllocationBar5 = AllocationBar5
	
	local AllocationBar6 = CoD.AllocationBar.new( menu, controller )
	AllocationBar6:setLeftRight( true, false, 114, 130 )
	AllocationBar6:setTopBottom( true, false, 0, 32 )
	self:addElement( AllocationBar6 )
	self.AllocationBar6 = AllocationBar6
	
	local AllocationBar7 = CoD.AllocationBar.new( menu, controller )
	AllocationBar7:setLeftRight( true, false, 133, 149 )
	AllocationBar7:setTopBottom( true, false, 0, 32 )
	self:addElement( AllocationBar7 )
	self.AllocationBar7 = AllocationBar7
	
	local AllocationBar8 = CoD.AllocationBar.new( menu, controller )
	AllocationBar8:setLeftRight( true, false, 152, 168 )
	AllocationBar8:setTopBottom( true, false, 0, 32 )
	self:addElement( AllocationBar8 )
	self.AllocationBar8 = AllocationBar8
	
	local AllocationBar9 = CoD.AllocationBar.new( menu, controller )
	AllocationBar9:setLeftRight( true, false, 171, 187 )
	AllocationBar9:setTopBottom( true, false, 0, 32 )
	self:addElement( AllocationBar9 )
	self.AllocationBar9 = AllocationBar9
	
	local AllocationBar10 = CoD.AllocationBar.new( menu, controller )
	AllocationBar10:setLeftRight( true, false, 190, 206 )
	AllocationBar10:setTopBottom( true, false, 0, 32 )
	self:addElement( AllocationBar10 )
	self.AllocationBar10 = AllocationBar10
	
	local AllocationBar11 = CoD.AllocationBar.new( menu, controller )
	AllocationBar11:setLeftRight( true, false, 209, 225 )
	AllocationBar11:setTopBottom( true, false, 0, 32 )
	self:addElement( AllocationBar11 )
	self.AllocationBar11 = AllocationBar11
	
	local AllocationBar12 = CoD.AllocationBar.new( menu, controller )
	AllocationBar12:setLeftRight( true, false, 228, 244 )
	AllocationBar12:setTopBottom( true, false, 0, 32 )
	self:addElement( AllocationBar12 )
	self.AllocationBar12 = AllocationBar12
	
	local AllocationBar13 = CoD.AllocationBar.new( menu, controller )
	AllocationBar13:setLeftRight( true, false, 247, 263 )
	AllocationBar13:setTopBottom( true, false, 0, 32 )
	self:addElement( AllocationBar13 )
	self.AllocationBar13 = AllocationBar13
	
	local AllocationBar14 = CoD.AllocationBar.new( menu, controller )
	AllocationBar14:setLeftRight( true, false, 266, 282 )
	AllocationBar14:setTopBottom( true, false, 0, 32 )
	self:addElement( AllocationBar14 )
	self.AllocationBar14 = AllocationBar14
	
	local AllocationBar15 = CoD.AllocationBar.new( menu, controller )
	AllocationBar15:setLeftRight( true, false, 285, 301 )
	AllocationBar15:setTopBottom( true, false, 0, 32 )
	self:addElement( AllocationBar15 )
	self.AllocationBar15 = AllocationBar15
	
	local AllocationBar16 = CoD.AllocationBar.new( menu, controller )
	AllocationBar16:setLeftRight( true, false, 304, 320 )
	AllocationBar16:setTopBottom( true, false, 0, 32 )
	self:addElement( AllocationBar16 )
	self.AllocationBar16 = AllocationBar16
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AllocationBar0:close()
		element.AllocationBar1:close()
		element.AllocationBar2:close()
		element.AllocationBar3:close()
		element.AllocationBar4:close()
		element.AllocationBar5:close()
		element.AllocationBar6:close()
		element.AllocationBar7:close()
		element.AllocationBar8:close()
		element.AllocationBar9:close()
		element.AllocationBar10:close()
		element.AllocationBar11:close()
		element.AllocationBar12:close()
		element.AllocationBar13:close()
		element.AllocationBar14:close()
		element.AllocationBar15:close()
		element.AllocationBar16:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

