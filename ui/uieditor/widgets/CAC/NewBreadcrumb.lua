-- 4d36eba4e1a55275cd40333d0f759695
-- This hash is used for caching, delete to decompile the file again

CoD.NewBreadcrumb = InheritFrom( LUI.UIElement )
CoD.NewBreadcrumb.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.NewBreadcrumb )
	self.id = "NewBreadcrumb"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 20 )
	self:setTopBottom( true, false, 0, 20 )
	
	local newBreadcrumb = LUI.UIImage.new()
	newBreadcrumb:setLeftRight( true, true, 0, 0 )
	newBreadcrumb:setTopBottom( true, true, 0, 0 )
	newBreadcrumb:setImage( RegisterImage( "uie_t7_menu_frontend_helptag" ) )
	self:addElement( newBreadcrumb )
	self.newBreadcrumb = newBreadcrumb
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				newBreadcrumb:completeAnimation()
				self.newBreadcrumb:setAlpha( 0 )
				self.clipFinished( newBreadcrumb, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				newBreadcrumb:completeAnimation()
				self.newBreadcrumb:setAlpha( 1 )
				self.clipFinished( newBreadcrumb, {} )
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
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
