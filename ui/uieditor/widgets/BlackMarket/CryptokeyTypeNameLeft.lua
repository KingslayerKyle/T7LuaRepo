-- 4a0602270ee544bfe253b79309b5e81d
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BlackMarket.CryptokeyTypeNameLeftInternal" )

CoD.CryptokeyTypeNameLeft = InheritFrom( LUI.UIElement )
CoD.CryptokeyTypeNameLeft.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CryptokeyTypeNameLeft )
	self.id = "CryptokeyTypeNameLeft"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 150 )
	self:setTopBottom( true, false, 0, 22 )
	self.anyChildUsesUpdateState = true
	
	local CryptokeyTypeNameLeftInternal = CoD.CryptokeyTypeNameLeftInternal.new( menu, controller )
	CryptokeyTypeNameLeftInternal:setLeftRight( true, false, 0, 150 )
	CryptokeyTypeNameLeftInternal:setTopBottom( false, false, -11, 11 )
	CryptokeyTypeNameLeftInternal:linkToElementModel( self, nil, false, function ( model )
		CryptokeyTypeNameLeftInternal:setModel( model, controller )
	end )
	CryptokeyTypeNameLeftInternal:linkToElementModel( self, "rarity", true, function ( model )
		local rarity = Engine.GetModelValue( model )
		if rarity then
			CryptokeyTypeNameLeftInternal.nameText:setText( LocalizeToUpperString( rarity ) )
		end
	end )
	self:addElement( CryptokeyTypeNameLeftInternal )
	self.CryptokeyTypeNameLeftInternal = CryptokeyTypeNameLeftInternal
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				CryptokeyTypeNameLeftInternal:completeAnimation()
				self.CryptokeyTypeNameLeftInternal:setAlpha( 0 )
				self.clipFinished( CryptokeyTypeNameLeftInternal, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				CryptokeyTypeNameLeftInternal:completeAnimation()
				self.CryptokeyTypeNameLeftInternal:setAlpha( 1 )
				self.clipFinished( CryptokeyTypeNameLeftInternal, {} )
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
		element.CryptokeyTypeNameLeftInternal:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
