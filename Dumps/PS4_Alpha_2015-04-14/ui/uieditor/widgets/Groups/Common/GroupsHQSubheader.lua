CoD.GroupsHQSubheader = InheritFrom( LUI.UIElement )
CoD.GroupsHQSubheader.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 8
	} )
	self:setAlignment( LUI.Alignment.Left )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GroupsHQSubheader )
	self.id = "GroupsHQSubheader"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 199 )
	self:setTopBottom( true, false, 0, 20 )
	
	local GroupHQTitle = LUI.UITightText.new()
	GroupHQTitle:setLeftRight( true, false, 0, 188 )
	GroupHQTitle:setTopBottom( true, false, 0, 20 )
	GroupHQTitle:setRGB( 0.87, 0.88, 0.78 )
	GroupHQTitle:setText( Engine.Localize( "GROUPS_HEADQUARTERS" ) )
	GroupHQTitle:setTTF( "fonts/UnitedSansRgMd.ttf" )
	self:addElement( GroupHQTitle )
	self.GroupHQTitle = GroupHQTitle
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, false, 196, 252 )
	Label0:setTopBottom( true, false, 0, 20 )
	Label0:setRGB( 0.87, 0.88, 0.78 )
	Label0:setAlpha( 0.8 )
	Label0:setTTF( "fonts/UnitedSansRgMd.ttf" )
	Label0:subscribeToGlobalModel( controller, "SelectedGroup", "memberStatusText", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Label0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	self.close = function ( self )
		self.Label0:close()
		CoD.GroupsHQSubheader.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

