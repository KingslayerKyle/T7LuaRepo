require( "ui.uieditor.widgets.BlackMarket.CryptokeyTypeNameInternal" )

CoD.CryptokeyTypeName = InheritFrom( LUI.UIElement )
CoD.CryptokeyTypeName.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CryptokeyTypeName )
	self.id = "CryptokeyTypeName"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 84 )
	self:setTopBottom( true, false, 0, 22 )
	self.anyChildUsesUpdateState = true
	
	local CryptokeyTypeNameInternal = CoD.CryptokeyTypeNameInternal.new( menu, controller )
	CryptokeyTypeNameInternal:setLeftRight( true, false, -18, 102 )
	CryptokeyTypeNameInternal:setTopBottom( true, false, 0, 22 )
	CryptokeyTypeNameInternal:linkToElementModel( self, nil, false, function ( model )
		CryptokeyTypeNameInternal:setModel( model, controller )
	end )
	CryptokeyTypeNameInternal:linkToElementModel( self, "rarity", true, function ( model )
		local rarity = Engine.GetModelValue( model )
		if rarity then
			CryptokeyTypeNameInternal.nameText:setText( LocalizeToUpperString( rarity ) )
		end
	end )
	self:addElement( CryptokeyTypeNameInternal )
	self.CryptokeyTypeNameInternal = CryptokeyTypeNameInternal
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				CryptokeyTypeNameInternal:completeAnimation()
				self.CryptokeyTypeNameInternal:setAlpha( 0 )
				self.clipFinished( CryptokeyTypeNameInternal, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				CryptokeyTypeNameInternal:completeAnimation()
				self.CryptokeyTypeNameInternal:setAlpha( 1 )
				self.clipFinished( CryptokeyTypeNameInternal, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CryptokeyTypeNameInternal:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

