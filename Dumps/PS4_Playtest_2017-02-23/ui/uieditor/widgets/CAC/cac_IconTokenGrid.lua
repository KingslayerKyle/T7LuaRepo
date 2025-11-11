require( "ui.uieditor.widgets.CAC.cac_IconTokenStatic" )

CoD.cac_IconTokenGrid = InheritFrom( LUI.UIElement )
CoD.cac_IconTokenGrid.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.cac_IconTokenGrid )
	self.id = "cac_IconTokenGrid"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 42 )
	self:setTopBottom( 0, 0, 0, 42 )
	self.anyChildUsesUpdateState = true
	
	local cacIconTokenStatic0 = CoD.cac_IconTokenStatic.new( menu, controller )
	cacIconTokenStatic0:setLeftRight( 0, 0, 0, 42 )
	cacIconTokenStatic0:setTopBottom( 0, 0, 0, 42 )
	self:addElement( cacIconTokenStatic0 )
	self.cacIconTokenStatic0 = cacIconTokenStatic0
	
	self.resetProperties = function ()
		cacIconTokenStatic0:completeAnimation()
		cacIconTokenStatic0:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				cacIconTokenStatic0:completeAnimation()
				self.cacIconTokenStatic0:setAlpha( 0 )
				self.clipFinished( cacIconTokenStatic0, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.cacIconTokenStatic0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

