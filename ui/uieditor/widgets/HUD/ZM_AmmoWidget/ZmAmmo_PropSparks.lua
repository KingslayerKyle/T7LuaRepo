-- ea66b9a5da3754a467f6ae5606c5f561
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ZM_FX.ZmFx_Spark2Ext" )

CoD.ZmAmmo_PropSparks = InheritFrom( LUI.UIElement )
CoD.ZmAmmo_PropSparks.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ZmAmmo_PropSparks )
	self.id = "ZmAmmo_PropSparks"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 143 )
	self:setTopBottom( true, false, 0, 75 )
	
	local ZmFxSpark2Ext00000 = CoD.ZmFx_Spark2Ext.new( menu, controller )
	ZmFxSpark2Ext00000:setLeftRight( true, false, 65.55, 137.56 )
	ZmFxSpark2Ext00000:setTopBottom( true, false, -12.7, 95.3 )
	ZmFxSpark2Ext00000:setRGB( 0, 0.39, 1 )
	ZmFxSpark2Ext00000:setYRot( 143 )
	ZmFxSpark2Ext00000:setZRot( -80 )
	ZmFxSpark2Ext00000:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ZmFxSpark2Ext00000 )
	self.ZmFxSpark2Ext00000 = ZmFxSpark2Ext00000
	
	local ZmFxSpark2Ext000000 = CoD.ZmFx_Spark2Ext.new( menu, controller )
	ZmFxSpark2Ext000000:setLeftRight( true, false, 65.55, 137.56 )
	ZmFxSpark2Ext000000:setTopBottom( true, false, -12.7, 95.3 )
	ZmFxSpark2Ext000000:setRGB( 0.31, 0.7, 1 )
	ZmFxSpark2Ext000000:setYRot( 143 )
	ZmFxSpark2Ext000000:setZRot( -80 )
	ZmFxSpark2Ext000000:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ZmFxSpark2Ext000000 )
	self.ZmFxSpark2Ext000000 = ZmFxSpark2Ext000000
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				ZmFxSpark2Ext00000:completeAnimation()
				self.ZmFxSpark2Ext00000:setAlpha( 0 )
				self.clipFinished( ZmFxSpark2Ext00000, {} )

				ZmFxSpark2Ext000000:completeAnimation()
				self.ZmFxSpark2Ext000000:setAlpha( 0 )
				self.clipFinished( ZmFxSpark2Ext000000, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				ZmFxSpark2Ext00000:completeAnimation()
				self.ZmFxSpark2Ext00000:setAlpha( 1 )
				self.clipFinished( ZmFxSpark2Ext00000, {} )

				ZmFxSpark2Ext000000:completeAnimation()
				self.ZmFxSpark2Ext000000:setAlpha( 1 )
				self.clipFinished( ZmFxSpark2Ext000000, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsInventoryPieceVisible( controller, "super_ee" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.super_ee" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.super_ee"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ZmFxSpark2Ext00000:close()
		element.ZmFxSpark2Ext000000:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

